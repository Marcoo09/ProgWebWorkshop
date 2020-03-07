<?php

require_once '../../../data.php';

session_start();
$userLogued = $_SESSION["userLogued"];

if (isUserLogged()) {

    if ($userLogued[is_admin] == 1) {
        $mySmarty = getSmartyForScenes();
        $mySmarty->assign("genre", getGenres());
        $mySmarty->display("addFilm.tpl");
    } else {

        header('location:../../../index.php');
    }
} else {

    header('location:login.php');
}


