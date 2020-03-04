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

//Smarty Helpers

function getSmarty() {
    $mySmarty = new Smarty();
    $mySmarty->template_dir = 'templates';
    $mySmarty->compile_dir = 'templates_c';
    $mySmarty->config_dir = 'config';
    $mySmarty->cache_dir = 'cache';
    return $mySmarty;
}

function getSmartyForScenes() {
    $mySmarty = new Smarty();
    $mySmarty->template_dir = '../../../templates';
    $mySmarty->compile_dir = '../../../templates_c';
    $mySmarty->config_dir = '../../../config';
    $mySmarty->cache_dir = '../../../cache';
    return $mySmarty;
}

//Smarty Helpers

//Onboarding Helpers

function getUser($user, $password) {
    $cn = getConnection();
    $passwordMd5 = md5($password);
    $cn->consulta('SELECT * FROM usuarios WHERE email=:email AND password=:password',array(
        array("email", $user, 'string'),array("password", $passwordMd5, 'string')
    ));
    return $cn->siguienteRegistro();
}

function login($user, $password) {
    $userDB = getUser($user,$password);
    if($userDB){
        return array(
            "user" => $userDB['email'],
            "name" => $userDB['alias'],
            "id"   => $userDB['id']
        );
    }
    return NULL;
}

function userExist($email) {
    $cn = getConnection();
    $cn->consulta('SELECT id, email FROM usuarios WHERE email=:email', array(
        array("email", $email, 'string')
    ));
    return $cn->cantidadRegistros() > 0;
}

function registerUser($user, $password, $alias) {
    $cn = getConnection();
    $passwordMd5 = md5($password);
    if(userExist($user)){
        return NULL;
    }
    $cn->consulta('INSERT INTO usuarios(email,alias,password) VALUES(:email,:alias,:password)',array(
        array("email", $user, 'string'),array("password", $passwordMd5, 'string'),array("alias", $alias, 'string')
    ));
    return login($user,$password);
}

//Onboarding Helpers

//Genres Helpers

function getGenres(){
    $cn = getConnection();
    $cn->consulta('SELECT id, nombre FROM generos ORDER BY nombre');
    return $cn->restantesRegistros();
}

function getGenreByName($genreName){
    $cn = getConnection();
    $cn->consulta("SELECT * FROM generos WHERE nombre LIKE '%' :name '%' ", array(array("name", $genreName,'string')));
    return $cn->siguienteRegistro();
}

function getGenre($genreId){
    $cn = getConnection();
    $cn->consulta('SELECT * FROM generos WHERE id = :id ', array(array("id", $genreId,'int')));
    return $cn->siguienteRegistro();
}

//Genres Helpers

//Films Helpers

function getFilms(){
    $cn = getConnection();
    $cn->consulta('SELECT * FROM peliculas ORDER BY titulo');
    return $cn->restantesRegistros();
}

function getFilmsFiltered($filterText,$filterType){
    if($filterText == ""){
       return getFilms();
    }
    $cn = getConnection();
    if($filterType == "title"){
        $cn->consulta("SELECT * FROM peliculas WHERE titulo LIKE '%' :title '%' ORDER BY titulo",array(array("title", $filterText,'string')));
    }else{
        $genre = getGenreByName($filterText);
        if($genre){
            $cn->consulta('SELECT * FROM peliculas WHERE id_genero = :id_genre ORDER BY titulo',array(array("id_genre", $genre['id'],'string')));
        }else{
            return NULL;
        }
    }
    return $cn->restantesRegistros();
}

function getFilm($filmId){
    $cn = getConnection();
    $cn->consulta('SELECT * FROM peliculas WHERE id = :id ', array(array("id", $filmId,'int')));
    return $cn->siguienteRegistro();
}

function getFilmsByGenreId($genreId){
    $cn = getConnection();
    $cn->consulta('SELECT * FROM peliculas WHERE id_genero = :genreId ', array(array("genreId", $genreId,'int')));
    return $cn->restantesRegistros();
}

function updateFilmPunctuation($filmId){
    $cn = getConnection();
    $cn->consulta("UPDATE peliculas SET puntuacion = (SELECT avg(puntuacion) FROM comentarios WHERE id_pelicula = :filmId AND estado = 'APROBADO')",array(
        array("filmId", $filmId, 'int')
    ));
}

//Films Helpers

//Casts Helpers

function getCastByFilm($filmId){
    $cn = getConnection();
    $cn->consulta('SELECT * FROM elencos WHERE id_pelicula = :id_pelicula',
                array(array("id_pelicula", $filmId,'int')));
    return $cn->restantesRegistros();
}

//Casts Helpers

//Comments Helpers

function getCommentsByFilmId($filmId){
    $cn = getConnection();
    $cn->consulta('SELECT * FROM comentarios WHERE id_pelicula = :filmId ', array(array("filmId", $filmId,'int')));
    return $cn->restantesRegistros();
}

function checkIfUserDoAComment($filmId,$userId){
    $cn = getConnection();
    $cn->consulta('SELECT id_usuario id_pelicula FROM comentarios WHERE id_pelicula = :filmId AND id_usuario = :userId ', array(
        array("filmId",$filmId,'int'),
        array("userId", $userId,'int')
        ));
    return $cn->cantidadRegistros() > 0;
}

function addComment($filmId, $comment, $userId,$punctuation){
    $cn = getConnection();
    $cn->consulta('INSERT INTO comentarios(id_pelicula,mensaje,id_usuario,puntuacion) VALUES(:filmId,:message,:userId,:punctuation)',array(
        array("filmId", $filmId, 'int'),array("message", $comment, 'string'),array("userId", $userId, 'int'),
        array("punctuation", $punctuation,'int')
    ));
}

//Comments Helpers