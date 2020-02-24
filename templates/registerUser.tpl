<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>registrar</title>
    </head>
    <body>
        <form action="doRegister.php" method="POST">
            Email: <input name="user" type="email" required/><br>
            Alias: <input name="alias" type="text" required/><br>
            Clave: <input name="password" type="password" minlength="6" required/><br>
            <input value="Register" type="submit"/><br>
        </form>
        {if (isset($err))}
            <label>Usuario ya existente</label>
        {/if}
    </body>
</html>