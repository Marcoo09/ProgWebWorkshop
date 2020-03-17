<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Log In</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <link href="styles.css" rel="stylesheet">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="js/jquery-3.4.1.min.js"></script>
    </head>
    <body>
        <div class="wrapper fadeInDown">
            <div id="formContent">
              <!-- Login Form -->
              <form action="doLogin.php" method="POST">
                <input name="user" id="user" class="fadeIn second" placeholder="Usuario" type="text"/>
                <input type="password" id="password" class="fadeIn third" name="password" placeholder="Password"/>
                <input type="submit" class="fadeIn fourth" value="Log In">
              </form>
              <div id="formFooter">
                <a class="underlineHover" href="../registerUser/register.php">Registrarme</a>
              </div>
            </div>
        </div>
    </body>
</html>