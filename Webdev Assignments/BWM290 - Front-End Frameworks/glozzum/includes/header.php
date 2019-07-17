<?php
    session_start();
    require("includes/dbconnect.php");

    //Register a user script
    if(isset($_POST['registersubmit'])){
        
        if((isset($_POST['registerUsername'])) && (isset($_POST['registerEmail'])) && (isset($_POST['registerPassword'])) && (isset($_POST['registerConfirmPassword']))){
            
            //perform further validation
            
            $username = $_POST['registerUsername'];
            $email = $_POST['registerEmail'];
            $password = $_POST['registerPassword'];
            $confirmPassword = $_POST['registerConfirmPassword'];
            
            //mysqli query
            $query = "SELECT username FROM users WHERE username = '$username';";
            //echo $query;
            
            $result = mysqli_query($conn, $query);
            $row = mysqli_fetch_assoc($result);
            
            if(!$row){
                $query = "INSERT INTO users VALUES ('$username', '$password', '$confirmPassword', '$email');";
                //echo $query;
                
                $result = mysqli_query($conn, $query);
            }else{
                echo "A user with this username already exists";
            }
            
        }
        
        else{
            echo "You must complete the form";
        } //end if-isset 
        
    } //end if-submit


    //Login script
    if(isset($_POST['loginsubmit'])){
         if((isset($_POST['loginUsername'])) && (isset($_POST['loginPassword']))){
             
              $username = $_POST['loginUsername'];
              $password = $_POST['loginPassword'];
             
            //finish login script
                    
            //mysqli query
            $query = "SELECT username, password FROM users WHERE username = '$username' AND password = '$password';";
            //echo $query;
            
            $result = mysqli_query($conn, $query);
            $row = mysqli_fetch_assoc($result);

            if($row){
                //set session variable
                $_SESSION['loginuser'] = $username;
                $loginuser = $_SESSION['loginuser'];
                //echo "Login successful";
            }else{
                echo "Login unsuccessful";
            }
             
         } //end if-isset
        
        
    } // end if-loginsubmit

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title><?php echo $title; ?></title>
    <!-- These link elements must be in this order -->
    <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
    <link rel="stylesheet" href="slick/slick.css">
    <link rel="stylesheet" href="slick/slick-theme.css">
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>

<body>
    <!-- Begin navbar -->
        <nav class="navbar navbar-expand-sm navbar-dark bg-dark">
            <div class="container">
                <a class="navbar-brand" href="index.php">Glozzum</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                  <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                  <ul class="navbar-nav">
                    <li class="nav-item 
                        <?php
                            if($title == 'Glozzum: Home'){
                                echo ' active';
                            }
                        ?>
                    ">
                      <a class="nav-link" href="index.php">Home <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item
                        <?php
                            if($title == 'Glozzum: About'){
                                echo ' active';
                            }
                        ?>
                    ">
                      <a class="nav-link" href="about.php">About Us</a>
                    </li>
                    <li class="nav-item
                        <?php
                            if($title == 'Glozzum: Services'){
                                echo ' active';
                            }
                        ?>
                    ">
                      <a class="nav-link" href="services.php">Services</a>
                    </li>
                    <li class="nav-item
                       <?php
                            if($title == 'Glozzum: Blog'){
                                echo ' active';
                            }
                        ?>
                    ">
                        <a class="nav-link" href="blog.php">Blog</a>
                    </li>
                    <li class="nav-item
                        <?php
                            if($title == 'Glozzum: Contact'){
                                echo ' active';
                            }
                        ?>
                    ">
                        <a class="nav-link" href="contact.php">Contact</a>
                    </li>
                  </ul>
                </div>
             <!-- Button trigger Login modal --> 
             <?php
                if(isset($_SESSION['loginuser'])){
                    echo '<a href="includes/logout.php">
                    <button type="button" class="btn btn-primary mx-2">Logout</button>
                    </a>';
                }else { 
                    echo '<button type="button" class="btn btn-primary mx-2" data-toggle="modal" data-target="#loginModal">Login</button>';
                }
             ?>
             <!-- Button trigger Register modal -->
             <?php
              if(isset($_SESSION['loginuser'])){ 
                echo '<span class="text-white mx-2" style="font-size: 22px;">Hello, '.$_SESSION['loginuser'].' </span>';
              }else {             
                echo '<button type="button" class="btn btn-primary mx-2" data-toggle="modal" data-target="#registerModal">Register</button>';   
              }  
             ?>
          </div> <!-- end .container -->
        </nav>
    <!-- End navbar -->