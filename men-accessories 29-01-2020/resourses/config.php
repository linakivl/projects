<?php
    ob_start();
    //** Χρηση της defined(), ελεγχος εάν έχει οριστεί(μ΄΄ονο για constants-σταθερες).( για μεταβλητες isset() )!
    defined("DS") ? null : define("DS",  DIRECTORY_SEPARATOR);
    defined("FRONT_INCLUDES") ? null : define("FRONT_INCLUDES", __DIR__ . DS . 'templates\front\includes');
    defined("BACK_INCUDES") ? null :  define("BACK_INCUDES", __DIR__ . DS . 'templates\back\includes');
  
    defined("DB") ? null : define("DB", "eshop");
    defined("HOST") ? null : define("HOST", "localhost");
    defined("USERNAME") ? null : define("USERNAME", "root");
    defined("PASSWORD") ? null : define("PASSWORD", "");
    
    $connection = mysqli_connect(HOST, USERNAME, PASSWORD, DB);
   /* change character set to utf8 */
    if (!mysqli_set_charset($connection, "utf8")) {
        printf("Error loading character set utf8: %s\n", mysqli_error($connection));
        exit();
    } else {
       mysqli_character_set_name($connection);
    }
    
    require_once("functions.php");
    
   
?>