<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Detalle pelicula</title>
        <script src="../../../js/jquery-3.4.1.min.js"></script>
        <script  src="../../../js/filmDetail.js"></script>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.14.0/css/mdb.min.css" rel="stylesheet">
        <link href="styles.css" rel="stylesheet">
    <input type="hidden" value="{$filmId}" id="filmId" />
    <input type="hidden" value="{$comment}" id="comment" />
</head>
<body>

    <div class="big-banner">
        <nav class="navbar navbar-expand-lg navbar-dark black scrolling-navbar">
            <a class="navbar-brand" href="../../../index.php">Film&Chips</a>
            <div class="container">

                <div class="collapse navbar-collapse" id="navbarSupportedContent">

                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Perfil
                            </a>
                            {if (isset($userLogued))}
                                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <a class="dropdown-item">{$userLogued.name}</a>
                                    <div class="dropdown-divider"></div>
                                    {if ({$userLogued.is_admin}==1)}
                                        <a class="dropdown-item" href="../saveFilm/saveFilm.php">Alta película</a>
                                        <div class="dropdown-divider"></div>
                                    {/if}
                                    <a class="dropdown-item" href="../logout/doLogout.php">Salir</a> 
                                </div>
                            {else}
                                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <a class="dropdown-item" href="../login/login.php">Inicio de Sesión</a> 
                                </div>
                            {/if}
                        </li>

                    </ul>      

                </div>



            </div>

        </nav>
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

            <!-- JQuery -->
            <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
            <!-- Bootstrap tooltips -->
            <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script>
            <!-- Bootstrap core JavaScript -->
            <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/js/bootstrap.min.js"></script>
            <!-- MDB core JavaScript -->
            <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.14.0/js/mdb.min.js"></script>
            </body>
            </html>