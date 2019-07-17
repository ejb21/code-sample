<?php
    session_start();
    unset($_SESSION['loginuser']);
    session_destroy();
    header("Location: ../index.php");
?>