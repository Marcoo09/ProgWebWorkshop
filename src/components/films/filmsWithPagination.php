<?php
require_once '../../../data.php';
//ini_set('display_errors', 1);

$mySmarty = getSmartyForScenes();

$genreId = 0;
$filterText = "";
if (isset($_GET["searchText"])) {
    $filterText = $_GET["searchText"];
}

$filterType = "title";
if (isset($_GET["filterType"])) {
    $filterType = $_GET["filterType"];
}

if (isset($_COOKIE["lastGenre"])) {
    $genreId = $_COOKIE["lastGenre"];
}

if (isset($_GET["genreId"])) {
    $genreId = $_GET["genreId"];
}

if($genreId == 0){
    $films = getFilmsFiltered($filterText,$filterType);
}else{
   $films = getFilmsByGenreId($genreId); 
    setcookie("lastGenre", $genreId, time() + (60 * 60 * 24), "/");
}   

$page = 1;
if (isset($_GET["pag"])) {
    $page = $_GET["pag"];
}

$pages = ceil(count($films)/6);

$mySmarty->assign("films",$films);
$mySmarty->assign("page",$page);
$mySmarty->assign("pages",$pages);

# mostrar el template
$mySmarty->display('filmsWithPagination.tpl');
