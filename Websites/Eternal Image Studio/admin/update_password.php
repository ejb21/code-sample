<?php
    session_start();
    if(!isset($_SESSION['user']) || !isset($_SESSION['user']['id'])){
        header("HTTP/1.1 401 Unauthorized");
        die("HTTP/1.1 401 Unauthorized");
    }

    $old_password = htmlspecialchars($_POST['old_password']);
    $new_password = htmlspecialchars($_POST['new_password']);
    $confirm_password = htmlspecialchars($_POST['confirm_password']);

    if(empty($old_password) || empty($new_password) || $new_password !== $confirm_password){
        die("Invalid data");
    }

    require_once '../includes/dbtools.php';
    if(update_user_password($old_password, $new_password)){
        header("Location: index.php");
    }else{
        die('Database error');
    }