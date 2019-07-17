<?php
    session_start();
    unset($_SERVER['PHP_AUTH_USER']);
    unset($_SERVER['PHP_AUTH_PW']);
    session_unset();
    session_destroy();
    header('Location: /');