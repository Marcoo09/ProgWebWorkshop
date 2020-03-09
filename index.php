<?php
require_once 'data.php';

# crear instancia de smarty
$mySmarty = getSmarty();

# cargar datos
session_start();
$user = $_SESSION["userLogued"];

# setear variables
$mySmarty->assign("userLogued", $user);
$mySmarty->assign("genres", getGenres());
$mySmarty->assign("filtro", "title");

# mostrar el template
$mySmarty->display('index.tpl');