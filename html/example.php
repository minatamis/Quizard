<?php
// get_questions.php

// Assuming you have a database connection
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "db_quizard";

$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Your SQL query to get new questions and answers
$sql = "SELECT T1.fld_question, T0.fldAnswer1, T0.fldAnswer2, T1.fld_answer
        FROM tblanswer T0
        LEFT JOIN tbl_questions T1 ON T0.fldQuestionId = T1.fld_questionId
        WHERE T1.fld_quizId = 1";

// Execute the query
$result = $conn->query($sql);

// Fetch the new set of questions and answers
$data = [];
while ($row = $result->fetch_assoc()) {
    $data[] = [
        'question' => $row['fld_question'],
        'answer1' => $row['fldAnswer1'],
        'answer2' => $row['fldAnswer2'],
	'answer' => $row['fld_answer'],
    ];
}

// Close the database connection
$conn->close();


echo json_encode($data);
?>
