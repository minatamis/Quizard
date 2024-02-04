<!-- index.html -->

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quiz App</title>
</head>
<body>

    <h1>Quiz App</h1>

    <div id="quiz-container">
        <label id="question-label">Loading...</label>
        <button class="answer-btn" data-answer="" onclick="checkAnswer(this)">Option 1</button>
        <button class="answer-btn" data-answer="" onclick="checkAnswer(this)">Option 2</button>
    </div>

    <p id="score">Score: 0</p>

    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script>
        $(document).ready(function () {
            var buttons = document.getElementsByClassName('answer-btn');
            var scoreDisplay = $('#score');
            var questionLabel = $('#question-label');
            var score = 0;

            function updateQuestionsAndAnswers() {
                $.ajax({
                    url: 'get_questions.php',
                    type: 'GET',
                    dataType: 'json',
                    success: function (data) {
                        var question = data[0].question;
                        var answer1 = data[0].answer1;
                        var answer2 = data[0].answer2;

                        questionLabel.text('Question: ' + question);
                        buttons[0].setAttribute('data-answer', answer1);
                        buttons[0].innerText = answer1;
                        buttons[1].setAttribute('data-answer', answer2);
                        buttons[1].innerText = answer2;
                    },
                    error: function () {
                        console.error('Error fetching new questions and answers.');
                    }
                });
            }

            updateQuestionsAndAnswers();

            function checkAnswer(button) {
                var selectedAnswer = button.getAttribute('data-answer');
                var correctAnswer = questionLabel.text().replace('Question: ', '');

                if (selectedAnswer === correctAnswer) {
                    score++;
                    scoreDisplay.text('Score: ' + score);
                }

                updateQuestionsAndAnswers();
            }

            // Optional: Add event listener for button clicks
            // for (var i = 0; i < buttons.length; i++) {
            //     buttons[i].addEventListener('click', function () {
            //         checkAnswer(this);
            //     });
            // }
        });
    </script>
</body>
</html>
