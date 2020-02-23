<?php
require_once '../../../data.php';
//ini_set('display_errors', 1);

$mySmarty = getSmartyForScenes();
$mySmarty ->display('registerUser.tpl');
