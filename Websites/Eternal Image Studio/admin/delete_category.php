<?php
    session_start();
    if(!isset($_SESSION['user']) || !isset($_SESSION['user']['id'])){
        header("HTTP/1.1 401 Unauthorized");
        die("HTTP/1.1 401 Unauthorized");
    }

    $id = (int) htmlspecialchars($_REQUEST['id']);

    require_once '../includes/dbtools.php';
    if(delete_image_category($id)){
        header('Location: index.php');
    }else{
        die('Database error.');
    }