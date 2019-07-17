<?php
    session_start();
    if(!isset($_SESSION['user']) || !isset($_SESSION['user']['id'])){
        header("HTTP/1.1 401 Unauthorized");
        die("HTTP/1.1 401 Unauthorized");
    }

    $category = (int) htmlspecialchars($_REQUEST['category']);
    $alt = htmlspecialchars($_REQUEST['alt']);
    $title = htmlspecialchars($_REQUEST['title']);
    $file = $_FILES['image'];

    if(empty($alt) || empty($title) || empty($file)){
        header("HTTP/1.1 400 Bad Request");
        die("HTTP/1.1 400 Bad Request");
    }

    $hash = hash_file("sha1", $file['tmp_name']);

    // load image
    $image = new Imagick();
    try {
        $image->readImage($file['tmp_name']);
    } catch (ImagickException $e) {
        die("Image processing error.");
    }

    $image->setImageType(IMAGETYPE_PNG);

    // resize
    try {
        $image->scaleImage(300, 300, true);
    } catch (ImagickException $e) {
        die("Image scale error.");
    }
    $thumb_path = '/images/thumbs/' . $hash . '.png';
    $image->writeImage(getcwd() . '/..' . $thumb_path);

    // reload image
    $image = new Imagick();
    $watermark = new Imagick();
    try{
        $image->readImage($file['tmp_name']);
        $watermark->readImage('watermark.png');
    }catch (ImagickException $e){
        die("Watermark loading error.");
    }

    // watermark
    $fit = min($image->getImageWidth(), $image->getImageHeight());
    try {
        $watermark->scaleImage($fit, $fit, true);
    } catch (ImagickException $e) {
        die("Watermark scaling error.");
    }

    $image->compositeImage($watermark, Imagick::COMPOSITE_OVER,
        $image->getImageWidth() - $watermark->getImageWidth(),
        $image->getImageHeight() - $watermark->getImageHeight());

    $mark_path = '/images/marked/' . $hash . '.png';
    $image->setImageType(IMAGETYPE_PNG);
    $image->writeImage(getcwd() . '/..' . $mark_path);

    require_once '../includes/dbtools.php';
    if(create_image($category, $alt, $title, $thumb_path, $mark_path)){
        header('Location: index.php');
    }else{
        die('Database error.');
    }