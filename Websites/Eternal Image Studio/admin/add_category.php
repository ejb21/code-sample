<?php
    session_start();
    if(!isset($_SESSION['user']) || !isset($_SESSION['user']['id'])){
        header("HTTP/1.1 401 Unauthorized");
        die("HTTP/1.1 401 Unauthorized");
    }

    $name = htmlspecialchars($_REQUEST['name']);

    if(empty($name)){
        die("Invalid data");
    }

    require_once '../includes/dbtools.php';
    if(create_image_category($name)){
        header("Location: index.php");
    }else{
        die('Database error');
    }