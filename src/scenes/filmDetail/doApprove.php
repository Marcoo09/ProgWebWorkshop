<?php

require_once '../../../data.php';

$filmId = $_GET["filmId"];

$commentId = $_GET["commentId"];

updateCommentStatus($commentId, 'APPROVED');

header('location:filmDetail.php?filmId='.$filmId);


