<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Detalle pelicula</title>
    </head>
    <body>
        <div id="productos">
            <h2>{$film.titulo}</h2>
        </div>
        <div id="date">
            <h3>{$film.fecha_lanzamiento}</h3>
        </div>
        <div id="summary">
            <h3>{$film.resumen}</h3>
        </div>
        <div id="points">
            <h3>{$film.puntuacion}</h3>
        </div>
        <div id="director">
            <h3>{$film.director}</h3>
        </div>
        <div id="genre">
            <h3>{$genre.nombre}</h3>
        </div>
        <div id="cast">
            <h2>Elenco</h2>
            <ul>
                {foreach from=$cast item=actor}
                    <li>
                        {$actor.nombre}
                    </li>
                {/foreach}

            </ul>
        </div>
        <div id="images">
            <img src="../../../img_films/{$film.id}"/>
        </div>
    </body>
</html>