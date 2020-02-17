<?php
require_once 'libs/Smarty.class.php';

function getConnection() {
    $user = "root";
    $password = "root";

    $cn = new PDO(
            'mysql:host=localhost;dbname=guia_cine', $user, $password);
    return $cn;
}

function getSmarty() {
    $mySmarty = new Smarty();
    $mySmarty->template_dir = 'templates';
    $mySmarty->compile_dir = 'templates_c';
    $mySmarty->config_dir = 'config';
    $mySmarty->cache_dir = 'cache';
    return $mySmarty;
}

function getUsers() {
    $cn = getConnection();
    $sql = "SELECT * FROM usuarios";
    $result = $cn->query($sql);
    $users = $result->fetchAll(PDO::FETCH_ASSOC);
    return $users;
}

function getCategories() {
    $categories = array("Procesadores", "Memorias", "Discos", "Gabinetes"
        , "Monitores", "Perifericos");
    return $categories;
}

function login($user, $password) {
    $users = getUsers();
    foreach($users as $userDB){
        if($user == $userDB['email'] && $password == $userDB['password']){
            return array(
                "user" => $userDB['email'],
                "name" => $userDB['alias']
            );
        }
    }
    return NULL;
}