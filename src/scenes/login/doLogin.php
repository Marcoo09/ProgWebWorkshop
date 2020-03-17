<?php

require_once '../../../data.php';

$user = $_POST["user"];
$password = $_POST["password"];

$userLogued = login($user, $password);

if (isset($userLogued)) {
    session_start();
    $_SESSION["userLogued"] = $userLogued;
    header('location:../../../index.php');
} else {
    header('location:login.php?err=1');
}