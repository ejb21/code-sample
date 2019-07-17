<?php
    session_start();
    if(!isset($_SESSION['user']) || !isset($_SESSION['user']['id'])){
        header("HTTP/1.1 401 Unauthorized");
        die("HTTP/1.1 401 Unauthorized");
    }

    $username = htmlspecialchars($_REQUEST['username']);
    $password = htmlspecialchars($_POST['password']);

    if(empty($username) || empty($password)){
        die("Invalid data");
    }

    require_once '../includes/dbtools.php';
    if(create_user($username, $password)){
        header("Location: index.php");
    }else{
        die('Database error');
    }