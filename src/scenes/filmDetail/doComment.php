<?php

require_once '../../../data.php';

session_start();
$user = $_SESSION["userLogued"];

$filmId = 1;
if (isset($_GET["filmId"])) {
    $filmId = $_GET["filmId"];
}

$comment = $_POST["comment"];

addComment($filmId,$comment,$user['id']);

header('location:filmDetail.php');


