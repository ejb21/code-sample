<?php include 'inc/header.php'; 

/*
if ($_GET['failed']) { ?>

    <div id="failed">

    </div>

<?php } ?>
*/

if (isset($_SESSION['user'])) { ?>

    <main id="login">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="header-effect logged-in">
                        <h1>Logged in successfully.</h1>
                        <h1 class="foreground">Logged in successfully.</h1>
                    </div>
                    <form id="logout" action="inc/logout.php" method="post">
                        <input type="submit" name="logout-submit" value="Logout">
                    </form>
                </div>
            </div>
        </div>
    </main>

<?php } else { ?>

    <main id="login">
        <div class="container">
            <div class="row">
                <div class="col-12 col-sm-6">
                    <div class="header-effect register">
                        <h1>Register</h1>
                        <h1 class="foreground">Register</h1>
                    </div>
                    <form id="register" action="inc/register.php" method="post">
                        <input type="text" pattern=".{3,16}" name="register-username">
                        <input type="password" pattern=".{3,32}" name="register-password">
                        <input type="submit" name="register-submit" value="Continue">
                    </form>
                </div>
                <div class="col-12 col-sm-6">
                    <div class="header-effect login">
                        <h1>Login</h1>
                        <h1 class="foreground">Login</h1>
                    </div>
                    <form id="register" action="inc/login.php" method="post">
                        <input type="text" pattern=".{3,16}" name="login-username">
                        <input type="password" pattern=".{3,32}" name="login-password">
                        <input type="submit" name="login-submit" value="Continue">
                    </form>
                </div>
            </div>
        </div>
    </main>

<?php }

include 'inc/footer.php'; ?>