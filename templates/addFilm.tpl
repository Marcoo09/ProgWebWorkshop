<!doctype html>
<html>
    <head>
        <meta charset="UTF-8">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
        <!-- Google Fonts -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap">
        <!-- Bootstrap core CSS -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
        <!-- Material Design Bootstrap -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.14.0/css/mdb.min.css" rel="stylesheet">
        <link rel="stylesheet" href="bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="styles.css">

        <title>Nueva pelicula</title>
    </head>
    <body>



        <form method="POST" action="doSaveFilm.php"
              enctype="multipart/form-data">

            <div class="container contact-form">
                <br>
                <div class="row">
                    <div class="col">
                        <input type="text" name="title" class="form-control" placeholder="Titulo" required>
                    </div>
                    <div class="col">
                        <input type="date" name="dateRelease"" class="form-control" placeholder="Fecha de lanzamiento" required>
                    </div>
                </div>
                <br>
                <div class="row">
                    <div class="col">
                        <input type="text" name="director" class="form-control" placeholder="Director" required>
                    </div>
                </div>
                <br>
                <div class="form-group">
                    <textarea type="text" name="description" class="form-control" id="exampleFormControlTextarea1" rows="3" placeholder="Descripción" required></textarea>
                </div>
                <br>
                <div class="row">
                    <div class="col">
                        <input type="text" name="youtube" class="form-control" placeholder="Enlace de YouTube">
                    </div>
                </div>
                <br>
                <div>
                    <select name="genre" class="custom-select" required>
                        {foreach from=$genre item=c}
                            <option value="{$c.id}">{$c.nombre}</option>
                        {/foreach}
                    </select>
                </div>
                <br>                   
                <div class="row">
                    <div class="custom-file col">
                        <input type="file" accept=".jpg,.png" name="image[]" id="customFile" multiple="multiple" required/>
                        <label class="custom-file-label" for="customFile">Elegir imagen pequeña</label>
                    </div>
                    <div class="custom-file col">
                        <input type="file" accept=".jpg,.png" name="bigImage[]" id="customBigFile" multiple="multiple" required/>
                        <label class="custom-file-label" for="customBigFile">Elegir imagen grande</label>
                    </div>
                </div>

                <div class="allign-right">
                    <input class="btn btn-outline-dark my-2 my-sm-0" value="Guardar" id="searchButton" type="submit"/>
                </div>

            </div>

        </form>

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