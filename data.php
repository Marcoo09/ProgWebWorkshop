<?php

include 'configuracion.php';
require_once 'libs/Smarty.class.php';
require_once 'src/helpers/class.Conexion.BD.php';

function getConnection() {
    $cn = new ConexionBD(env('DB'), env('DB_HOST'),
            env('DB_NAME'), env('DB_USERNAME'), env('DB_PASSWORD'));
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

function getUserById($id) {
    $cn = getConnection();
    $cn->consulta('SELECT * FROM usuarios WHERE id=:id ', array(
        array("id", $id, 'int')
    ));
    return $cn->siguienteRegistro();
}

function getUser($user, $password) {
    $cn = getConnection();
    $passwordMd5 = md5($password);
    $cn->consulta('SELECT * FROM usuarios WHERE email=:email AND password=:password', array(
        array("email", $user, 'string'), array("password", $passwordMd5, 'string')
    ));
    return $cn->siguienteRegistro();
}

function login($user, $password) {
    $userDB = getUser($user, $password);
    if ($userDB) {
        return array(
            "user" => $userDB['email'],
            "name" => $userDB['alias'],
            "is_admin" =>$userDB['es_administrador'],
            "id" => $userDB['id']
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
    if (userExist($user)) {
        return NULL;
    }
    $cn->consulta('INSERT INTO usuarios(email,alias,password) VALUES(:email,:alias,:password)', array(
        array("email", $user, 'string'), array("password", $passwordMd5, 'string'), array("alias", $alias, 'string')
    ));
    return login($user, $password);
}

//Onboarding Helpers
//Genres Helpers

function getGenres() {
    $cn = getConnection();
    $cn->consulta('SELECT id, nombre FROM generos ORDER BY nombre');
    return $cn->restantesRegistros();
}

function getGenreByName($genreName) {
    $cn = getConnection();
    $cn->consulta("SELECT * FROM generos WHERE nombre LIKE '%' :name '%' ", array(array("name", $genreName, 'string')));
    return $cn->siguienteRegistro();
}

function getGenre($genreId) {
    $cn = getConnection();
    $cn->consulta('SELECT * FROM generos WHERE id = :id ', array(array("id", $genreId, 'int')));
    return $cn->siguienteRegistro();
}

//Genres Helpers
//Films Helpers

function getFilms() {
    $cn = getConnection();
    $cn->consulta('SELECT * FROM peliculas ORDER BY fecha_lanzamiento desc');
    return $cn->restantesRegistros();
}

function getFilmsFiltered($filterText, $filterType) {
    if ($filterText == "") {
        return getFilms();
    }
    $cn = getConnection();
    if ($filterType == "title") {
        $cn->consulta("SELECT * FROM peliculas WHERE titulo LIKE '%' :title '%' ORDER BY fecha_lanzamiento desc", array(array("title", $filterText, 'string')));
    } else {
        $genre = getGenreByName($filterText);
        if ($genre) {
            $cn->consulta('SELECT * FROM peliculas WHERE id_genero = :id_genre ORDER BY fecha_lanzamiento desc', array(array("id_genre", $genre['id'], 'string')));
        } else {
            return NULL;
        }
    }
    return $cn->restantesRegistros();
}

function getFilm($filmId) {
    $cn = getConnection();
    $cn->consulta('SELECT * FROM peliculas WHERE id = :id ', array(array("id", $filmId, 'int')));
    return $cn->siguienteRegistro();
}

function getFilmsByGenreId($genreId) {
    $cn = getConnection();
    $cn->consulta('SELECT * FROM peliculas WHERE id_genero = :genreId ', array(array("genreId", $genreId, 'int')));
    return $cn->restantesRegistros();
}

function updateFilmPunctuation($filmId) {
    $cn = getConnection();
    $cn->consulta("UPDATE peliculas SET puntuacion = (SELECT avg(puntuacion) FROM comentarios WHERE id_pelicula = :filmId AND estado = 'APROBADO') WHERE id = :filmId", array(
        array("filmId", $filmId, 'int')
    ));
}

//Films Helpers
//Casts Helpers

function getCastByFilm($filmId) {
    $cn = getConnection();
    $cn->consulta('SELECT * FROM elencos WHERE id_pelicula = :id_pelicula',
            array(array("id_pelicula", $filmId, 'int')));
    return $cn->restantesRegistros();
}

//Casts Helpers
//Comments Helpers

function getCommentsByFilmId($filmId) {
    $cn = getConnection();
    $cn->consulta('SELECT * FROM comentarios WHERE id_pelicula = :filmId ORDER BY id desc', array(array("filmId", $filmId, 'int')));
    return $cn->restantesRegistros();
}

function getQuantityOfApprovedCommentsByFilmId($filmId) {
    $cn = getConnection();
    $cn->consulta('SELECT * FROM comentarios WHERE id_pelicula = :filmId AND estado = :status', array(array("filmId", $filmId, 'int'),
                                    array('status','APROBADO','string')));
    return $cn->cantidadRegistros();
}

function checkIfUserDoAComment($filmId, $userId) {
    $cn = getConnection();
    $cn->consulta('SELECT id_usuario id_pelicula FROM comentarios WHERE id_pelicula = :filmId AND id_usuario = :userId ', array(
        array("filmId", $filmId, 'int'),
        array("userId", $userId, 'int')
    ));
    return $cn->cantidadRegistros() > 0;
}

function addComment($filmId, $comment, $userId, $punctuation) {
    $cn = getConnection();
    $cn->consulta('INSERT INTO comentarios(id_pelicula,mensaje,id_usuario,puntuacion) VALUES(:filmId,:message,:userId,:punctuation)', array(
        array("filmId", $filmId, 'int'), array("message", $comment, 'string'), array("userId", $userId, 'int'),
        array("punctuation", $punctuation, 'int')
    ));
}

function isUserLogged() {
    session_start();
    $user = $_SESSION["userLogued"];
    return isset($user);
}

function saveFilm($title, $genre, $dateRelease, $description,  $director, $youtube ,$image,$bigImage) {
    $cn = getConnection();
    $cn->consulta('INSERT INTO peliculas(titulo, id_genero, fecha_lanzamiento, resumen, director,youtube_trailer) '
            . 'VALUES (:titulo, :id_genero, :fecha_lanzamiento, :resumen, :director, :youtube_trailer)', array(
                
        array("titulo", $title, 'string'),
        array("id_genero", $genre , 'int'),
        array("fecha_lanzamiento", $dateRelease , 'string'),     
        array("resumen",  $description, 'string'),
        array("director", $director, 'string'),        
        array("youtube_trailer", $youtube, 'string'),
                 
    ));

    $id = $cn->ultimoIdInsert();
    if (is_uploaded_file($image)) {
        move_uploaded_file($image, "../../../img_films/".$id);
    }
    if (is_uploaded_file($bigImage)) {
        move_uploaded_file($bigImage, "../../../img_films/".$id.'-big');
    }
}

function updateCommentStatus($commentId, $status){
        $cn = getConnection();
        if($status === 'APPROVED'){
            $cn->consulta('UPDATE comentarios SET estado = :status WHERE id = :commentId',array(
                array("commentId", $commentId,'int'),  
                array("status", 'APROBADO','string')
            ));            
        }else{
            $cn->consulta('UPDATE comentarios SET estado = :status WHERE id = :commentId',array(
                array("commentId", $commentId,'int'),  
                array("status", 'RECHAZADO','string')
            ));    
        }
}

//Comments Helpers