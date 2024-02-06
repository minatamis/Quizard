<?php
require_once "config.php";

$sql = "CALL `sp_getQuestions`()";

$result = $link->query($sql);

$data = [];
while ($row = $result->fetch_assoc()) {
    $data[] = [
        'question' => $row['fld_question'],
        'answer1' => $row['fld_answer1'],
        'answer2' => $row['fld_answer2'],
	'answer' => $row['fld_answer'],
    ];
}

$link->close();

echo json_encode($data);
?>