<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Guía de cine</title>
        <link rel="stylesheet" type="text/css" href="css/index.css">
        <script src="js/jquery-3.4.1.min.js"></script>
        <script src="js/index.js"></script>
        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
        <!-- Google Fonts -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap">
        <!-- Bootstrap core CSS -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
        <!-- Material Design Bootstrap -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.14.0/css/mdb.min.css" rel="stylesheet">
       
    </head>

    <body>
        <nav class="navbar navbar-expand-lg navbar-dark black scrolling-navbar">

            <a class="navbar-brand" href="#">Film&Chips</a>

            <div class="container">



                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">

                    <ul class="navbar-nav ml-auto">

                        <li class="nav-item">
                            
                            <form class="form-inline my-2 my-lg-0">

                                <input class="form-control mr-sm-2" type="search" id="searchField" placeholder="Ingresa tu busqueda" aria-label="Ingresa tu busqueda">

                                <button class="btn btn-outline-light my-2 my-sm-0" id="searchButton" type="submit">Buscar</button>

                            </form>
                        </li>

                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Filtro
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" id="Ftitle" name="filterType" value="title" href="#">Titulo</a>
                                <a class="dropdown-item" id="Fgenre" name="filterType" value="genre" href="#">Genero</a>
                            </div>
                        </li>


                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Perfil
                            </a>
                            {if (isset($userLogued))}
                                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <a class="dropdown-item">{$userLogued.name}</a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="src/scenes/logout/doLogout.php">Salir</a> 
                                </div>
                            {else}
                                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <a class="dropdown-item" href="src/scenes/login/login.php">Inicio de Sesion</a> 
                                </div>
                            {/if}
                        </li>

                    </ul>      

                </div>



            </div>



        </nav>



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