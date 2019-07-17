<?php
    session_start();
    if(!isset($_SESSION['user']) || !isset($_SESSION['user']['id'])){
        header("HTTP/1.1 401 Unauthorized");
        die("HTTP/1.1 401 Unauthorized");
    }

    $id = (int) htmlspecialchars($_REQUEST['id']);
    $category = (int) htmlspecialchars($_REQUEST['category']);
    $alt = htmlspecialchars($_REQUEST['alt']);
    $title = htmlspecialchars($_REQUEST['title']);

    if(empty($alt) || empty($title)){
        header("HTTP/1.1 400 Bad Request");
        die("HTTP/1.1 400 Bad Request");
    }

    require_once '../includes/dbtools.php';
    if(update_image($id, $category, $alt, $title)){
        header('Location: index.php');
    }else{
        die('Database error.');
    }