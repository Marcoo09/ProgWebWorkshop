<?php

require_once '../../../data.php';

$user = $_POST["user"];
$password = $_POST["password"];
$alias = $_POST["alias"];

$userLogued = registerUser($user, $password, $alias);

if (isset($userLogued)) {
    session_start();
    $_SESSION["userLogued"] = $userLogued;
    header('location:../../../index.php');
} else {
    header('location:register.php?err=1');
}