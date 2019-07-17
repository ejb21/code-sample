<?php

$fullName = htmlspecialchars($_POST['fullName']);
$email = htmlspecialchars($_POST['email']);
$size = htmlspecialchars($_POST['prints']);
$figureType = htmlspecialchars($_POST['figureType']);
$medium = htmlspecialchars($_POST['medium']);
$artStyle = htmlspecialchars($_POST['artStyle']);
$bg = htmlspecialchars($_POST['background']);
if ($bg == 'Background') $bg = 'Yes';
else $bg = 'No';
$msg = htmlspecialchars($_POST['message']);

$to      = /*'gusmauk@cs.com'*/ 'soxfanextraordinaire@gmail.com';
$subject = 'Eternal Image - Contact Form Submission';

$headers = 'MIME-Version: 1.0' . "\r\n";
$headers .= 'Content-type: text/html; charset=utf-8' . "\r\n";

$headers .= 'From: ' . $email . "\r\n" .
    'Reply-To: ' . $email . "\r\n" .
    'X-Mailer: PHP/' . phpversion();

$message = <<<EOT
<html>
<head>
	<style>
		body { font-family: 'Helvetica', 'Arial', sans-serif; margin: 0; }
		body * {  box-sizing: border-box; }
		td { padding: 20px 0; }
		tr:last-child > td { border-bottom: none !important; }
		
		table
		{
			width: 600px; margin: 0 auto; border-collapse: collapse; box-shadow: 0 5px 15px rgba(0,0,0,0.15);
			border: 2px solid #4A325A; border-radius: 7px; display: block; margin-top: 50px;
		}
		
		tr:not(:first-child) > td:first-child
		{
			font-size: 18px; text-align: right; background-color: #9D7BB4; color: white;
			font-weight: 600; padding-right: 25px; border-bottom: 2px solid #563968; width: 190px;
			text-shadow: 0 2px 2px black;
		}
		
		tr:not(:first-child) > td:last-child
		{
			text-align: center; padding: 0 10px; width: 410px;
			background-color: #f5f5f5; border-bottom: 2px solid #aaa;
		}
		
		tr > td:last-child:hover { background-color: #E8E8E8; }
		
		tr:first-child > td:first-child
		{
			background-color: #563a69; text-align: center; color: white;
			text-shadow: 0 2px 1px black; font-weight: 600; font-size: 28px;
		}
	</style>
</head>
<body>
	<table>
		<tr><td colspan="2">Commission Request</td></tr>
		<tr>
			<td>Name:</td><td>$fullName</td>
		</tr>
		<tr>
			<td>Email:</td><td>$email</td>
		</tr>
		<tr>
			<td>Size:</td><td>$size</td>
		</tr>
		<tr>
			<td>Figure Type:</td><td>$figureType</td>
		</tr>
		<tr>
			<td>Medium:</td><td>$medium</td>
		</tr>
		<tr>
			<td>Art Style:</td><td>$artStyle</td>
		</tr>
		<tr>
			<td>Background:</td><td>$bg</td>
		</tr>
		<tr>
			<td>Message:</td><td>$msg</td>
		</tr>
	</table>
</body>
</html>
EOT;

mail($to, $subject, $message, $headers);

ob_start();
header('Location: http://eternalimage.studio/#thanks');
ob_end_flush();
die();

?>