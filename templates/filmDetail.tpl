<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Detalle pelicula</title>
    </head>
    <body>
        <h1>Información de pelicula</h1>
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
            <img style="height:100px;width:100px;" src="../../../img_films/{$film.id}"/>
        </div>
        <h1>Información de comentarios</h1>
        <div id="comments">
            <h2>Comentarios</h2>
                {foreach from=$comments item=comment}
                    {if $comment.estado === "APROBADO"}
                        <label>
                            Mensaje: {$comment.mensaje}
                        </label>
                        <label>
                            Id Usuario: {$comment.id_usuario}
                        </label>
                        <label>
                           Estado {$comment.estado}
                        </label>
                    {/if}
                {/foreach}
                
                {if (isset($userLogued)) && !$currentUserHasCommentsInThisFilm}
                    <h2>Dar comentario</h2>
                        <form action="doComment.php" method="POST">
                            Comentario: <input name="comment" type="text"/><br>
                            <input value="Comentar" type="submit"/><br>
                        </form>
                {/if}

        </div>
    </body>
</html>