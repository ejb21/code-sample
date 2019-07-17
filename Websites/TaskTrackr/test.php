<?php
require_once "helpers/csrf.php";

$csrf = new CSRF_Protect();
?>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8"/>
	<title>Test Page</title>
</head>
<body>
<?php
if(!isset($_SESSION['user_id'])){
	// We're not logged in right now.
?>
<form method="post" action="actions/login.php">
	<? $csrf->echoInputField(); ?>
	<input type="text" placeholder="Username" name="username"/>
	<input type="password" placeholder="Password" name="password"/>
	<input type="submit" value="Login"/>
</form>
<form method="post" action="actions/register.php">
	<? $csrf->echoInputField(); ?>
	<input type="text" placeholder="Username" name="username"/>
	<input type="text" placeholder="First Name" name="first_name"/>
	<input type="text" placeholder="Last Name" name="last_name"/>
	<input type="password" placeholder="Password" name="password0"/>
	<input type="password" placeholder="Confirm Password" name="password1"/>
	<input type="submit" value="Register"/>
</form>
<?php
}else{
?>
<h1><?=$_SESSION['user_id']?></h1>
<form method="post" action="actions/add_task.php">
	<? $csrf->echoInputField(); ?>
	<input type="text" placeholder="Task Name" name="name"/>
	<input type="number" step="0.0001" placeholder="Latitude" name="latitude"/>
	<input type="number" step="0.0001" placeholder="Longitude" name="longitude"/>
	<input type="submit" value="Add Task"/>
</form>
<? include("helpers/render_tasks_table.php"); ?>
<form method="post" action="actions/modify_account.php">
	<? $csrf->echoInputField(); ?>
	<input type="text" placeholder="Username" name="username"/>
	<input type="text" placeholder="First Name" name="first_name"/>
	<input type="text" placeholder="Last Name" name="last_name"/>
	<input type="password" placeholder="Password" name="password0"/>
	<input type="password" placeholder="Confirm Password" name="password1"/>
	<input type="submit" value="Modify Account"/>
</form>
<form method="post" action="actions/logout.php">
	<? $csrf->echoInputField(); ?>
	<input type="submit" value="Logout"/>
</form>
<?php
}
?>
</body>
</html>