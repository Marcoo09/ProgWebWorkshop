<?php

function getCategories() {
    $categories = array("Procesadores", "Memorias", "Discos", "Gabinetes"
        , "Monitores", "Perifericos");
    return $categories;
}

function login($user, $password) {
    if($user == "test" && $password == "test"){
        return array(
            "user" => "test",
            "name" => "Usuario de Prueba"
        );
    }
    
    return NULL;
}