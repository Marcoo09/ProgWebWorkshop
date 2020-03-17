<?php

require_once '../../../data.php';

session_start();
$userLogued = $_SESSION["userLogued"];

if (isset($userLogued)&&($userLogued[is_admin] == 1)) {
  
    $image = $_FILES["image"]["tmp_name"][0];
    $bigImage = $_FILES["bigImage"]["tmp_name"][0];

   saveFilm($_POST["title"],$_POST["genre"],$_POST["dateRelease"], 
            $_POST["description"],$_POST["director"],$_POST["youtube"]
            ,$image, $bigImage);
    
   header('location:../../../index.php');
}

