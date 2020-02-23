<?php

require_once 'data.php';
//ini_set('display_errors', 1);

# crear instancia de smarty
$mySmarty = getSmarty();

# cargar datos
session_start();
$user = $_SESSION["userLogued"];

//$catId = 1;
//if (isset($_COOKIE["ultimaCategoria"])) {
//    $catId = $_COOKIE["ultimaCategoria"];
//}
//
//if (isset($_GET["catId"])) {
//    $catId = $_GET["catId"];
//}

//$categoria = getCategoria($catId);
//if (isset($categoria)) {
//    setcookie("ultimaCategoria", $catId, time() + (60 * 60 * 24), "/");
//}

# setear variables
$mySmarty->assign("userLogued", $user);
$mySmarty->assign("genres", getGenres());
$mySmarty->assign("films", getFilms());

# mostrar el template
$mySmarty->display('index.tpl');