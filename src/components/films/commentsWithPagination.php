<?php
require_once '../../../data.php';
//ini_set('display_errors', 1);

session_start();
$user = $_SESSION["userLogued"];

$mySmarty = getSmartyForScenes();

$page = 1;
if (isset($_GET["pag"])) {
    $page = $_GET["pag"];
}

$Id = $_GET["Id"];

$comentarios = getCommentsByFilmId($Id);
$quantityOfElements;
if($user['is_admin']){
    $quantityOfElements = count($comentarios);
}else{
    $quantityOfElements = getQuantityOfApprovedCommentsByFilmId($Id);
}
$pages = ceil($quantityOfElements/5);

$arrayUsers = array();
foreach($comentarios as $comment){
    $userWhichDoTheComment = getUserById($comment['id_usuario']);
    $arrayUsers = $arrayUsers + array($userWhichDoTheComment['id'] => $userWhichDoTheComment['alias']);
}

$mySmarty->assign("page",$page);
$mySmarty->assign("pages",$pages);
$mySmarty->assign("Id",$Id);
$mySmarty->assign("comentarios",$comentarios);
$mySmarty->assign("userLogued",$user);
$mySmarty->assign('quantityOfComments',$quantityOfElements);
$mySmarty->assign('arrayUsers',$arrayUsers);

# mostrar el template
$mySmarty->display('commentsWithPagination.tpl');


