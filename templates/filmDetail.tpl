<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Detalle pelicula</title>
        <script src="../../../js/jquery-3.4.1.min.js"></script>
        <script  src="../../../js/filmDetail.js"></script>
        <link href="styles.css" rel="stylesheet">
        <input type="hidden" value="{$filmId}" id="filmId" />
        <input type="hidden" value="{$comment}" id="comment" />
    </head>
    <body>
        <div id="images">
            <img style="height:100px;width:100px;" src="../../../img_films/{$film.id}"/>
        </div>
        <div id="mainContainer" class="mainContainer">
            <div id="nameContainer">
                <h1>{$film.titulo}</h2>
            </div>
            <div id="descriptionContainer">
                <h2>Descripción</h2>
                <p>{$film.resumen}</p>
            </div>
            <div class="secondaryContainer">
                <div class="firstColumn growable">
                    <h4>Lanzamiento</h4>
                    <p>{$film.fecha_lanzamiento}</p>
                </div>
                <div class="secondColumn growable">
                    <h4>Director</h4>
                    <p>{$film.director}</p>
                </div>
            </div>
            <div class="secondaryContainer">
                <div class="firstColumn growable">
                    <h4>Género</h4>
                    <p>{$genre.nombre}</p>
                </div>
                <div class="secondColumn growable">
                    <h4>Puntuación</h4>
                    <p>{$film.puntuacion}</p>
                </div>                
            </div> 
            <div class="secondaryContainer">
                <div class="firstColumn growable">
                    <h4>Actores</h4>
                        <p>
                        {foreach from=$cast item=actor}
                            {$actor.nombre},
                        {/foreach}
                        </p>
                </div>
            </div>             
        </div>
  
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