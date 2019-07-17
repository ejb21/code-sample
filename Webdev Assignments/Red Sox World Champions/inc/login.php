<?php
    session_start();
    include '../inc/dbconnect.php';

    if((isset($_POST['login-username'])) && (isset($_POST['login-password'])))
    {
        $username = $_POST['login-username'];
        $password = $_POST['login-password'];
        $query = "SELECT username, password FROM users WHERE username = '$username' AND password = '$password';";
        
        $result = mysqli_query($conn, $query);
        $row = mysqli_fetch_assoc($result);

        if($row)
        {
            $_SESSION['user'] = $username;
            $user = $_SESSION['user'];
            header("Location: ../login.php?success");
        }
        else header("Location: ../login.php?failed");
    }
?>