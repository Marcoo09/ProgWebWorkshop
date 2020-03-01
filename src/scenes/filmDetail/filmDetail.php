<?php
require_once '../../../data.php';
//ini_set('display_errors', 1);

$filmId = 1;
if (isset($_GET["filmId"])) {
    $filmId = $_GET["filmId"];
}
$film = getFilm($filmId);

$mySmarty = getSmartyForScenes();

$mySmarty->assign("film",$film);

$mySmarty ->display('filmDetail.tpl');
