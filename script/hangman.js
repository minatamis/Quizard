$(document).ready(function () {
    var buttons = document.getElementsByClassName('choice-button');
    var questionLabel = $('#question-label');
    var score = 0;
    var lives = 6;
    let correctAnswer = new Array();
    let answer = new Array();
    let letters = new Array();
    var message;
    var filledBlanks = 0;
    var part = 6;
    var game = 3;

    function updateQuestionAndAnswers(data) {
        if (data.length > cnt && cnt < 20) {
            $("#question-label").text(data[cnt].question);
            answer[0] = data[cnt].answer1;
            answer[1] = data[cnt].answer2;

            letters = answer[0].split('').concat(answer[1].split(''));

            shuffleArray(letters);
            for (let i = 0; i < 10; i++) 
            {
                $("#lttr" + (i+1)).show();
                $("#lttr" + (i+1)).text(letters[i]);
            }

            correctAnswer = data[cnt].answer.split('');
            for (let i = 0; i < 3; i++) 
            {
                $("#blnk" + i).text('');
            }

        } else {
            showScore(score, lives);
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

    function checkAnswer(clickedLetter) {
        if (answer[0].includes(clickedLetter)) 
        {
            var index = correctAnswer.indexOf(clickedLetter);
            $("#blnk" + index).text(clickedLetter);
            removeLetter(clickedLetter);
            filledBlanks++;
            if (filledBlanks === 3) 
            {
                cnt++;
                score++;
                filledBlanks = 0;
                $.ajax({
                    url: '../html/getQuestions.php',
                    type: 'GET',
                    dataType: 'json',
                    success: function (data) {
                        updateQuestionAndAnswers(data);
                    },
                    error: function (data) {
                        console.error('Error fetching new questions and answers. ');
                    }
                });
            }
        } else {
            if(lives>1)
            {
                var i = part-lives;
                $("#part" + i).css("background-color", "white");
                lives--;
                
            }else
            {
                showScore(score, lives);
            }
            
        }
    }

    function removeLetter(letter) {
        var letterId = "#lttr" + (letters.indexOf(letter) + 1);
        $(letterId).hide();
    }

    function shuffleArray(array) {
        for (let i = array.length - 1; i > 0; i--) {
            const j = Math.floor(Math.random() * (i + 1));
            [array[i], array[j]] = [array[j], array[i]];
        }
    }

    var cnt = 15;
    $.ajax({
        url: '../html/getQuestions.php',
        type: 'GET',
        dataType: 'json',
        success: function (data) {
            updateQuestionAndAnswers(data);

            for (let i = 0; i < 10; i++) {
                $("#lttr" + (i+1)).click(function () {
                    checkAnswer($(this).text());
                });
            }
            
        },
        error: function (data) {
            console.error('Error fetching new questions and answers. ');
        }
    });
});