<?php

require_once '../../../data.php';

session_start();
$user = $_SESSION["userLogued"];

$filmId = 1;
if (isset($_GET["filmId"])) {
    $filmId = $_GET["filmId"];
}

$comment = $_POST["comment"];
$punctuation = $_POST["punctuation"];

addComment($filmId,$comment,$user['id'],$punctuation);

header('location:filmDetail.php');


