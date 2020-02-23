<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Guía de cine</title>
        <link rel="stylesheet" type="text/css" href="css/ventas.css">
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
        </div>
        <div id="categorias">
            <h2>Categorias</h2>
            <ul>
{*                {foreach from=$categorias item=cat}
                    <li>
                        <a href=#" class="categoria" catId="{$cat}">
                            {$cat}
                        </a>
                    </li>
                {/foreach}*}

            </ul>
        </div>
        <div id="productos">
           
        </div>
    </body>
</html>