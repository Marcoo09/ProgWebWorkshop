<?php
require_once '../../../data.php';
//ini_set('display_errors', 1);

session_start();
$user = $_SESSION["userLogued"];
        
$filmId = 1;
if (isset($_GET["filmId"])) {
    $filmId = $_GET["filmId"];
}

$currentUserHasCommentsInThisFilm = checkIfUserDoAComment($filmId,$user['id']);

$film = getFilm($filmId);
$comment = getCommentsByFilmId($filmId);

$mySmarty = getSmartyForScenes();
$mySmarty->assign("genre",getGenre($film['id_genero']));
$mySmarty->assign("film",$film);
$mySmarty->assign("cast",getCastByFilm($filmId));
$mySmarty->assign("comment",$comment);
$mySmarty->assign("filmId",$filmId);
$mySmarty->assign("userLogued",$user);
$mySmarty-> assign("currentUserHasCommentsInThisFilm",$currentUserHasCommentsInThisFilm);


$mySmarty ->display('filmDetail.tpl');
