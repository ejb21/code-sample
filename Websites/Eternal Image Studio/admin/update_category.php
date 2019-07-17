<?php
    session_start();
    if(!isset($_SESSION['user']) || !isset($_SESSION['user']['id'])){
        header("HTTP/1.1 401 Unauthorized");
        die("HTTP/1.1 401 Unauthorized");
    }

    $id = (int) htmlspecialchars($_REQUEST['id']);
    $name = htmlspecialchars($_REQUEST['name']);

    if(empty($name)){
        die("Invalid data");
    }

    require_once '../includes/dbtools.php';
    if(update_image_category($id, $name)){
        header('Location: index.php');
    }else{
        die('Database error.');
    }