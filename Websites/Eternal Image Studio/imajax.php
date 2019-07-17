<?php
require_once 'includes/dbtools.php';
if(!isset($_REQUEST['id'])){
    header('HTTP/1.1 400 Bad Request');
    die('{}');
}
$data = get_images($_REQUEST['id']);
if(!$data){
    header('HTTP/1.1 404 Not Found');
    die('{}');
}
echo json_encode($data);