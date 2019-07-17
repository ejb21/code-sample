<?php
    $dbhost = "localhost";
    $dbuser = "nrwhzjmr_glozzer";
    $dbpass = "K. Youk 420";
    $dbname = "nrwhzjmr_glozzum";

    $conn = mysqli_connect($dbhost, $dbuser, $dbpass, $dbname);

    if(!$conn){
        echo " -- Error - unable to connect to database -- ";
    }


?>