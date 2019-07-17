<?php
    session_start();
    include '../inc/dbconnect.php';

    if((isset($_POST['register-username'])) && (isset($_POST['register-password'])))
    {
        $username = $_POST['register-username'];
        $password = $_POST['register-password'];
        $query = "SELECT username FROM users WHERE username = '$username';";
        
        $result = mysqli_query($conn, $query);
        $row = mysqli_fetch_assoc($result);
        
        if(!$row)
        {
            $query = "INSERT INTO users VALUES ('$username', '$password');";
            $result = mysqli_query($conn, $query);
            header("Location: ../login.php?created");
        }
        else header("Location: ../login.php?dupe");
    }
?>