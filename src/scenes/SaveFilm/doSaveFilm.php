<?php

require_once '../../../data.php';

if ((isUserLogged())&&($userLogued[is_admin] == 1)) {
  
    $image = $_FILES["image"]["tmp_name"];
   
   SaveFilm($_POST["title"],$_POST["genre"],$_POST["dateRelease"], 
            $_POST["description"],$_POST["description"],$_POST["youtube"]
            ,$image);
    
   header('location:../../../index.php');
}

