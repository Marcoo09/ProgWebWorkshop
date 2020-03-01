<?php
require_once '../../../data.php';
//ini_set('display_errors', 1);

$filmId = 1;
if (isset($_GET["filmId"])) {
    $filmId = $_GET["filmId"];
}
$film = getFilm($filmId);

$mySmarty = getSmartyForScenes();

$mySmarty->assign("genre",getGenre($film['id_genero']));
$mySmarty->assign("film",$film);
$mySmarty->assign("cast",getCastByFilm($filmId));

$mySmarty ->display('filmDetail.tpl');
