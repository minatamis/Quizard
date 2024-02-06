$(document).ready(function () {
    var buttons = document.getElementsByClassName('choice-button');
    var questionLabel = $('#question-label');
    var score = 0;
    var lives = 3;
    var correctAnswer;
    let answer = new Array();
    var message;
    var game = 1;
    function updateQuestionAndAnswers(data) {
        if (data.length > cnt && cnt<10) {
            $("#question-label").text(data[cnt].question);
            answer[0] = data[cnt].answer1;
            answer[1] = data[cnt].answer2;
            shuffleArray(answer);
            $("#btn1").text(answer[0]);
            $("#btn2").text(answer[1]);
            correctAnswer = data[cnt].answer
        } else {
            showScore(score,lives);
        }
    }
    
    function shuffleArray(array) {
        for (let i = array.length - 1; i > 0; i--) {
            const j = Math.floor(Math.random() * (i + 1));
            [array[i], array[j]] = [array[j], array[i]];
        }
    }
    
    function CompareIfCorrect(answer){
        if (answer == correctAnswer){
            reduceLives(".life-right");
            score++;
        }else{
            reduceLives(".life");
            lives--;
        }
    }
    function reduceLives(life) {
        var lives = $(life);
        var remainingLives = lives.filter(':visible');
        
        if (remainingLives.length > 1) {
            remainingLives.last().hide();
        } else {
            showScore(score,lives);
        }
    }

    function showScore(score,lives) {
        if(lives>0)
        {
            message = "Congratulations!";
        }
        else
        {
            message = "You Died!";
        }
        location.replace("congrats.php?score=" + score + "&message=" + message+"&game="+game);
    }

    
    var cnt = 0;
    $.ajax({
            url: '../html/getQuestions.php',
            type: 'GET',
            dataType: 'json',
            success: function (data) {
            
                updateQuestionAndAnswers(data);
                
                $('#btn1').click(function () {
                    CompareIfCorrect($("#btn1").text());
                    cnt++;
                    updateQuestionAndAnswers(data); 
                });
                
                $('#btn2').click(function () {
                    CompareIfCorrect($("#btn2").text());
                    cnt++;
                    updateQuestionAndAnswers(data); 
                });
            },
            error: function (data) {
                console.error('Error fetching new questions and answers. ');
            }
        });
});