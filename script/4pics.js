$(document).ready(function () {
    var buttons = document.getElementsByClassName('choice-button');
    var questionLabel = $('#question-label');
    var score = 0;
    var lives = 3;
    let correctAnswer = new Array();
    let initialAnswer = new Array();
    let answer = new Array();
    let letters = new Array();
    var correct;
    var message = "Congratulations!";
    var blank = 0;
    var game = 2;
    var cnt = 10;

    function updateQuestionAndAnswers(data) {
        if (data.length > cnt && cnt < 15) {
            $("#question-label").text(data[cnt].question);
            answer[0] = data[cnt].answer1;
            answer[1] = data[cnt].answer2;

            letters = answer[0].split('').concat(answer[1].split(''));

            shuffleArray(letters);
            showChoices();

            correctAnswer = data[cnt].answer.split('');
            correct = data[cnt].answer
            for (let i = 0; i < 5; i++)
            {
                $("#blnk" + i).text('');
            }
            addimages();

        } else {
            location.replace("congrats.php?score=" + score + "&message=" + message+"&game="+game);
        }
    }

    function addimages() {
        $(".image-container").empty(); // clear the #smallimages div
        var dir = "../img/" + (cnt-9) + "image"; // directory base url

        // add image elements
        for (var i = 1; i <= 4; ++i) {
            var imagelocation = dir + i + ".jpg" ;
            $("#img"+(i)).append("<img src=" + imagelocation + " class='hintimage'>");
        }
        // $("#smallimages").append("<br>");
        // for (var i = 3; i <= 4; ++i) {
        //     var imagelocation = dir + i + ".jpg" ;
        //     $("#smallimages").append("<img src=" + imagelocation + " class='hintimage'>");
        // }
    }

    function clear(){
        for (let i = 0; i < 5; i++) {
            $("#blnk" + i).text('');

        }
        showChoices();
        blank = 0;
        initialAnswer = [];
    }

    $("#clear").click(clear);
    
    function showChoices(){
        for (let i = 0; i < 10; i++) 
        {
            $("#lttr" + (i + 1)).show();
            $("#lttr" + (i + 1)).text(letters[i]);
        }
    }


    function goToBlank(clickedLetter){
        $("#blnk" + blank).text(clickedLetter);
        initialAnswer.push(clickedLetter);
        removeLetter(clickedLetter);
        blank++;

    }

    function checkAnswer(ans) {
        if (ans == correct) 
        {
            score++;
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

    
    $.ajax({
        url: '../html/getQuestions.php',
        type: 'GET',
        dataType: 'json',
        success: function (data) {
            updateQuestionAndAnswers(data);

            for (let i = 0; i < 10; i++) {
                $("#lttr" + (i + 1)).click(function () {
                    goToBlank($("#lttr" + (i + 1)).text());
                });
            }
            
            $('#next').click(function () {
                if(blank != 5){
                    alert("Please Fill All Blanks")
                }else{
                    var answer = initialAnswer.join('');
                    checkAnswer(answer);
                    clear()
                    cnt++;
                    updateQuestionAndAnswers(data); 
                }
            });
        },
        error: function (data) {
            console.error('Error fetching new questions and answers. ');
        }
    });
    
});