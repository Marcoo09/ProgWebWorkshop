<?php
require_once 'libs/Smarty.class.php';
require_once 'src/helpers/class.Conexion.BD.php';

function getConnection() {
    $user = "root";
    $password = "root";
    $cn = new ConexionBD("mysql", "localhost", "guia_cine", $user, $password);
    $cn->conectar();
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

function getUser($user, $password) {
    $cn = getConnection();
    $passwordMd5 = md5($password);
    $cn->consulta('SELECT * FROM usuarios WHERE email=:email AND password=:password',array(
        array("email", $user, 'string'),array("password", $passwordMd5, 'string')
    ));
    return $cn->siguienteRegistro();
}

function getCategories() {
    $categories = array("Procesadores", "Memorias", "Discos", "Gabinetes"
        , "Monitores", "Perifericos");
    return $categories;
}

function login($user, $password) {
    $userDB = getUser($user,$password);
    if($userDB){
        return array(
            "user" => $userDB['email'],
            "name" => $userDB['alias']
        );
    }
    return NULL;
}


function registerÙser($user, $password, $alias) {
    $cn = getConnection();
    $passwordMd5 = md5($password);
    $cn->consulta('INSERT INTO usuarios(email,alias,password) VALUES(:email,:alias,:password)',array(
        array("email", $user, 'string'),array("password", $passwordMd5, 'string'),array("alias", $alias, 'string')
    ));
    return login($user,$password);
}