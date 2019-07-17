<?php
    require("_includes/dbconnect.php");

    //Register a user script
    if(isset($_POST['submit'])){
        
        if((isset($_POST['username'])) && (isset($_POST['email'])) && (isset($_POST['password'])) && (isset($_POST['confirmPassword']))){
            
            //perform further validation
            
            $username = $_POST['username'];
            $email = $_POST['email'];
            $password = $_POST['password'];
            
            //mysqli query
            $query = "SELECT username FROM users WHERE username = '$username';";
            //echo $query;
            
            $result = mysqli_query($conn, $query);
            $row = mysqli_fetch_assoc($result);
            
            if(!$row){
                $query = "INSERT INTO users VALUES ('$username', '$email', '$password');";
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
         if((isset($_POST['loginusername'])) && (isset($_POST['loginpassword']))){
             
              $username = $_POST['loginusername'];
              $password = $_POST['loginpassword'];
             
            //finish login script
                    
            
             
         } //end if-isset
        
        
    } // end if-loginsubmit

    


?>