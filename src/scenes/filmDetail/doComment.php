<?php

require_once '../../../data.php';

session_start();
$user = $_SESSION["userLogued"];

$filmId = $_POST["filmIdent"];
$comment = $_POST["comment"];
$punctuation = $_POST["punctuation"];

addComment($filmId,$comment,$user['id'],$punctuation);

updateFilmPunctuation($filmId);

header('location:filmDetail.php?filmId='.$filmId);


