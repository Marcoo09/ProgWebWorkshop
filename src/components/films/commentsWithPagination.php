<?php
require_once '../../../data.php';
//ini_set('display_errors', 1);

$mySmarty = getSmartyForScenes();

$page = 1;
if (isset($_GET["pag"])) {
    $page = $_GET["pag"];
}

$Id = $_GET["Id"];

$comentarios = getCommentsByFilmId($Id);
$pages = ceil(count($comentarios)/5);

$mySmarty->assign("page",$page);
$mySmarty->assign("pages",$pages);
$mySmarty->assign("Id",$Id);
$mySmarty->assign("comentarios",$comentarios);


# mostrar el template
$mySmarty->display('commentsWithPagination.tpl');


