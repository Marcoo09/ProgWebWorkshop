<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Detalle pelicula</title>
        <script src="../../../js/jquery-3.4.1.min.js"></script>
        <script  src="../../../js/filmDetail.js"></script>
        <input type="hidden" value="{$filmId}" id="filmId" />
        <input type="hidden" value="{$comment}" id="comment" />
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
            
                
                {if (isset($userLogued)) && !$currentUserHasCommentsInThisFilm}
                    <h2>Dar comentario</h2>
                        <form action="doComment.php" method="POST">
                            Comentario: <input name="comment" type="text"/><br>
                            <input type="number" name="punctuation"
                                min="1" max="5"><br>
                            <input value="Comentar" type="submit"/><br>
                            <input type="hidden" value="{$filmId}" id="filmIdent" />
                        </form>
                {/if}

        
        <div id="commentlist">
        </div>
    </body>
</html>