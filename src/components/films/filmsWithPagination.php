<?php
require_once '../../../data.php';
//ini_set('display_errors', 1);

$mySmarty = getSmartyForScenes();

//
//$catId = 1;
//if (isset($_COOKIE["ultimaCategoria"])) {
//    $catId = $_COOKIE["ultimaCategoria"];
//}
//
//if (isset($_GET["catId"])) {
//    $catId = $_GET["catId"];
//}
//
//$pag = 1;
//if (isset($_GET["pag"])) {
//    $pag = $_GET["pag"];
//}
//
//$categoria = getCategoria($catId);
//if (isset($categoria)) {
//    setcookie("ultimaCategoria", $catId, time() + (60 * 60 * 24), "/");
//}

$mySmarty->assign("films", getFilms());

//$mySmarty->assign("categoria", $categoria);
//$mySmarty->assign("productos", getProductosDeCategoria($catId, $pag));
//$mySmarty->assign("pagina", $pag);
//$mySmarty->assign("paginas", cantidadPaginasCategoria($catId));

# mostrar el template
$mySmarty->display('filmsWithPagination.tpl');
