<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title></title>
    </head>
    <body>
        <form action="doLogin.php" method="POST">
            Usuario: <input name="user" type="text"/><br>
            Clave: <input name="password" type="password"/><br>
            <input value="Login" type="submit"/><br> 
            <a href="../registerUser/register.php">Registrarme</a>
                <?php
                    if(isset($_GET["err"])) {
                        echo("<label>Usuario/clave incorrectos.</label>");
                    }
                ?>
            </form>
    </body>
</html>
