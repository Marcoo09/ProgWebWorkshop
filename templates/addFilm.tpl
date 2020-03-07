<!doctype html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Nueva pelicula</title>
    </head>
    <body>
        <form method="POST" action="doSaveFilm.php"
              enctype="multipart/form-data">

            <div class="form-group">

                <label for="exampleInputEmail1">Título</label>
                <input type="text" class="form-control" id="inputTitle" aria-describedby="emailHelp" placeholder="Ingresar Título">

            </div>

            <form>
                <div class="row">
                    <div class="col">
                        <input type="text" class="form-control" placeholder="First name">
                    </div>
                    <div class="col">
                        <input type="text" class="form-control" placeholder="Last name">
                    </div>
                </div>
            </form>


            <label>Fecha de lanzamiento</label>
            <input type="date" name="dateRelease" required/>
            <br>
            <label>Descripción</label>
            <input type="text" name="description" required/>
            <br>
            <label>Director</label>
            <input type="text" name="director" required/>
            <br>
            <label>Enlace de YouTube</label>
            <input type="text" name="youtube" />
            <br>        

            <label>Género</label>
            <select name="genre">
                {foreach from=$genre item=c}
                    <option value="{$c.id}">{$c.nombre}</option>
                {/foreach}
            </select>

            <br>

            <label>Imagen</label>
            <input type="file" accept=".jpg,.png" name="image" required/>
            <br>
            <input type="submit" value="Guardar" />
        </form>
    </body>
</html>