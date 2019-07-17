<!doctype html>
<html>

<head>
    <meta charset="utf-8">
    <title>TaskTrackr</title>
    
    <link href="css/reset.css" rel="stylesheet" type="text/css">
    <link href="css/splashstyle.css" rel="stylesheet" type="text/css">
    
    
    <script>
        function login()
            {
                document.getElementById( 'nightfall' ).style.display = "block" ;
                document.getElementById( 'loginpanel' ).style.display = "block" ;
            }
        
        function register()
            {
                document.getElementById( 'nightfall' ).style.display = "block" ;
                document.getElementById( 'registerpanel' ).style.display = "block" ;
            }
        
        function cancel()
            {
                document.getElementById( 'registerpanel' ).style.display = "none" ;
                document.getElementById( 'nightfall' ).style.display = "none" ;
            }
    </script>
</head>

<body>
    <div id="curtains"><img src="images/curtains.png"></div>
    <div id="logo"><img src="images/logo-splash.png"></div>
    
    <div id="buttons">
    <button onclick="login()" id="login">LOG IN</button>
    <button onclick="register()" id="register">REGISTER</button>
    </div>
    
    
<div id="nightfall">
    <div id="loginpanel">
    <?php
        require_once "helpers/csrf.php";
        $csrf = new CSRF_Protect();
    ?>
        <form method="post" action="actions/login.php">
            <? $csrf->echoInputField(); ?>

            <label for="username" id="usernamelabel">USERNAME:</label><br>
            <input type="text" name="username" id="username" required autofocus><br>

            <label for="password" id="passwordlabel">PASSWORD:</label><br>
            <input type="password" name="password" id="password" required>

            <button type="submit">LOG IN</button>
            <input type="button" onclick="cancel()" value="CANCEL">
        </form>
    </div>
    
    
    <div id="registerpanel">
    <?php
        require_once "helpers/csrf.php";
        $csrf = new CSRF_Protect();
    ?>
        <form id="registerform" method="post" action="actions/register.php">
            <?php $csrf->echoInputField(); ?>
            
            <label for="fname" id="fnamelabel">FIRST NAME:</label><br>
            <input type="text" name="fname" id="fname" required autofocus><br>
            
            <label for="lname" id="lnamelabel">LAST NAME:</label><br>
            <input type="text" name="lname" id="lname" required><br>
            
            <label for="username" id="usernamelabel">USERNAME:</label><br>
            <input type="text" name="username" id="username" required><br>
            
            <label for="password" id="passwordlabel">PASSWORD:</label><br>
            <input type="password" name="password" id="password" minlength="12" required><br>
            
            <label for="confpass" id="confpasslabel">CONFIRM PASSWORD:</label><br>
            <input type="password" name="confpass" id="confpass" minlength="12" required><br>
            
            <button type="submit">REGISTER</button>
            <input type="button" onclick="cancel()" value="CANCEL">
        </form>
    </div>
</div>
    
</body>

</html>