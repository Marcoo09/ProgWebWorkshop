<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Registrar</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <link href="styles.css" rel="stylesheet">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="js/jquery-3.4.1.min.js"></script>
    </head>
    <body>
        <div class="wrapper fadeInDown">
            <div id="formContent">
                <form action="doRegister.php" method="POST">
                    <input name="user" type="email" id="user" class="fadeIn first" placeholder="Usuario" required/>
                    <input name="alias" id="alias" class="fadeIn second" placeholder="Alias" type="text" required/>
                    <input type="password" id="password" class="fadeIn third" name="password" placeholder="password"  minlength="6" required/>
                    <input type="submit" class="fadeIn fourth" value="Registrar">
                </form>
                {if (isset($err))}
                <div id="formFooter">
                    Usuario ya existente
                </div>                
                {/if}
            </div>
        </div>
    </body>
</html>