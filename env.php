<?php
function env($key, $default = null)
{
    $variables = array(
        'DB_HOST' => 'localhost',
        'DB_USERNAME' => 'root',
        'DB_PASSWORD' => 'root',
        'DB_NAME' => 'guia_cine',
        'DB' => 'mysql',
        );
    $value = $variables[$key];
    if ($value === false) {
        return $default;
    }
    return $value;
    
}
