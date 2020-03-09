<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Detalle pelicula</title>
        <script src="../../../js/jquery-3.4.1.min.js"></script>
        <script  src="../../../js/filmDetail.js"></script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
        <link href="styles.css" rel="stylesheet">
    <input type="hidden" value="{$filmId}" id="filmId" />
    <input type="hidden" value="{$comment}" id="comment" />
</head>
<body>

    <div class="big-banner">
        <img src="../../../img_films/{$film.id}-big">
        <div class="big-banner-shadow"></div>
        <!---->
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
            <div class="bootstrap snippets">
                <div class="col-md-6 col-md-offset-2 col-sm-12">
                    <div class="comment-wrapper">
                        <div class="panel panel-info">
                            <div class="panel-heading">
                                <h2>Panel de comentarios</h2>
                            </div>
                            <div class="panel-body">
                                <form action="doComment.php" method="POST">
                                    <hr>
                                    <textarea class="form-control" placeholder="Escribe un comentario" rows="3" name="comment"></textarea>
                                    <br>
                                    <input type="number" name="punctuation"
                                           min="1" max="5" class="form-control" placeholder="Puntua esta pelicula">
                                    <br>
                                    <input type="hidden" value="{$filmId}" name="filmId" />
                                    <br>
                                    <input value="Enviar para revisión" class="btn btn-info pull-right" type="submit"/><br>
                                    <div class="clearfix"></div>
                                    <hr>
                                </form>

                            </div> 
                        </div> 
                    </div> 
                </div> 
            {/if}

            <div id="commentlist">
            </div>
            </body>
            </html>