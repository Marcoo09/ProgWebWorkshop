<?php

require_once '../../../data.php';

$filmId = $_GET["filmId"];

$commentId = $_GET["commentId"];

updateCommentStatus($commentId, 'DENIED');

updateFilmPunctuation($filmId);

header('location:filmDetail.php?filmId='.$filmId);


