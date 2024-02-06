from pyscript import $, jQuery

def update_question_and_answers(data, cnt):
    if len(data) > cnt < 10:
        question_label.text(data[cnt]['question'])
        answer[0] = data[cnt]['answer1']
        answer[1] = data[cnt]['answer2']
        shuffle_array(answer)
        $("#btn1").text(answer[0])
        $("#btn2").text(answer[1])
        correct_answer = data[cnt]['answer']
    else:
        show_score(score, lives)

def shuffle_array(array):
    import random
    for i in range(len(array) - 1, 0, -1):
        j = random.randint(0, i)
        array[i], array[j] = array[j], array[i]

def compare_if_correct(answer):
    global score, lives
    if answer == correct_answer:
        reduce_lives(".life-right")
        score += 1
    else:
        reduce_lives(".life")
        lives -= 1

def reduce_lives(life):
    lives = $(life)
    remaining_lives = lives.filter(':visible')

    if len(remaining_lives) > 1:
        remaining_lives.last().hide()
    else:
        show_score(score, lives)

def show_score(score, lives):
    global message, game
    if lives > 0:
        message = "Congratulations!"
    else:
        message = "You Died!"
    window.location.replace("congrats.php?score=" + str(score) + "&message=" + message + "&game=" + str(game))

cnt = 0
score = 0
lives = 3
correct_answer = None
answer = [None, None]
message = None
game = 1

jQuery(document).ready(lambda: (
    buttons = document.getElementsByClassName('choice-button'),
    question_label = $('#question-label'),

    jQuery.ajax({
        'url': '../html/getQuestions.php',
        'type': 'GET',
        'dataType': 'json',
        'success': lambda data: (
            update_question_and_answers(data, cnt),
            $('#btn1').click(lambda: (
                compare_if_correct($("#btn1").text()),
                cnt += 1,
                update_question_and_answers(data, cnt)
            )),
            $('#btn2').click(lambda: (
                compare_if_correct($("#btn2").text()),
                cnt += 1,
                update_question_and_answers(data, cnt)
            ))
        ),
        'error': lambda data: (
            console.error('Error fetching new questions and answers. ')
        )
    })
))
