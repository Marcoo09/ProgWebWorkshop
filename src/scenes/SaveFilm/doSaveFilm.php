<?php

require_once '../../../data.php';

session_start();
$userLogued = $_SESSION["userLogued"];

if (isset($userLogued)&&($userLogued[is_admin] == 1)) {
  
    $image = $_FILES["image"]["tmp_name"];
   
   SaveFilm($_POST["title"],$_POST["genre"],$_POST["dateRelease"], 
            $_POST["description"],$_POST["director"],$_POST["youtube"]
            ,$image);
    
   header('location:../../../index.php');
}

