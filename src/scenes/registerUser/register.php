<?php
require_once '../../../data.php';
//ini_set('display_errors', 1);

$err = NULL;
if(isset($_GET["err"])) {
    $err = 1;
}

$mySmarty = getSmartyForScenes();
$mySmarty->assign('err',$err);
$mySmarty ->display('registerUser.tpl');
