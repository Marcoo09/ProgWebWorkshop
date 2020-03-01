<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Guía de cine</title>
        <link rel="stylesheet" type="text/css" href="css/ventas.css">
        <script src="js/jquery-3.4.1.min.js"></script>
        <script src="js/index.js"></script>
    </head>
    <body>
{*        {include file="encabezado.tpl"}*}
        <div id="menu">
            <ul>
                <li><a href="#">Pagina Principal</a></li>
                    {if (isset($userLogued))}
                    <li>Hola {$userLogued.name} <a href="src/scenes/logout/doLogout.php">Salir</a></li>
                    {else}
                    <li><a href="src/scenes/login/login.php">Inicio de Sesion</a></li>
                    {/if}
                <li><a href="#">Contacto</a></li>
            </ul>
        </div>
        <div id="buscador">
            <label>Ingresa tu busqueda</label>
            <input type="text"/>
            <input type="button" value="Buscar" />
            <label><input type="radio" name="title" value="Titulo" checked>Titulo</label>
            <label><input type="radio" name="genre" value="Genero">Genero</label>
        </div>
        <div id="genres">
            <h2>Géneros</h2>
            <ul>
                {foreach from=$genres item=genre}
                    <li>
                        <a href=#" class="genre" genreId="{$genre.id}">
                            {$genre.nombre}
                        </a>
                    </li>
                {/foreach}

            </ul>
        </div>
        <div id="films">
        </div>
    </body>
</html>