<?php
function get_connection(){
    $host = "localhost";
    $db_username = "thecomic_eis2";
    $db_password = "K1q20RQmCtTe";
    $database = "thecomic_eis2";

    $conn = mysqli_connect($host, $db_username, $db_password, $database);

    if(!$conn){
        die("Error: You are not connected to the database!");
    }

    return $conn;
}

function create_user($username, $password){
    $conn = get_connection();

    $stmt = $conn->prepare("select * from users where username = ?");
    $stmt->bind_param('s', $username);
    $stmt->execute();

    $result = $stmt->get_result();

    if($result && $result->num_rows > 0){
        $stmt->close();
        $conn->close();
        return false;   // user exists
    }
    $stmt->close();

    $stmt = $conn->prepare("insert into users(username, password) values(?, ?)");
    $stmt->bind_param('ss', $username, hash_password($password));
    $success =  $stmt->execute();

    $stmt->close();
    $conn->close();
    return $success;
}

function get_user($username, $password){
    $conn = get_connection();

    $stmt = $conn->prepare("select * from users where username = ? and password = ?");
    $stmt->bind_param('ss', $username, hash_password($password));
    $stmt->execute();

    $result = $stmt->get_result();

    $user = false;
    if($result && $result->num_rows > 0){
        $user = $result->fetch_assoc();
    }

    $stmt->close();
    $conn->close();

    return $user;
}

function update_user_password($old_password, $new_password){
    session_start();
    if(!isset($_SESSION['user']) || !isset($_SESSION['user']['id']))
        return false;   // not signed in

    $conn = get_connection();

    $stmt = $conn->prepare("select * from users where id = ? and password = ?");
    $stmt->bind_param('is', $_SESSION['user']['id'], hash_password($old_password));
    $stmt->execute();

    $result = $stmt->get_result();

    if($result && $result->num_rows <= 0){
        $stmt->close();
        $conn->close();
        return false;   // original password incorrect
    }
    $stmt->close();

    $stmt = $conn->prepare("update users set password = ? where id = ?");
    $stmt->bind_param('si', hash_password($new_password), $_SESSION['user']['id']);
    $success = $stmt->execute();

    $stmt->close();
    $conn->close();

    return $success;
}

function create_image_category($category){
    $conn = get_connection();

    $stmt = $conn->prepare("select * from categories where name = ?");
    $stmt->bind_param('s', $category);
    $stmt->execute();

    $result = $stmt->get_result();

    if($result && $result->num_rows > 0){
        $stmt->close();
        $conn->close();
        return false;       // category exists
    }
    $stmt->close();

    $stmt = $conn->prepare("insert into categories(name) values(?)");
    $stmt->bind_param('s', $category);
    $result = $stmt->execute();

    $stmt->close();
    $conn->close();

    return $result !== false;
}

function update_image_category($category_id, $name){
    $conn = get_connection();

    $stmt = $conn->prepare("update categories set name = ? where id = ?");
    $stmt->bind_param('si', $name, $category_id);
    $success = $stmt->execute();

    $stmt->close();
    $conn->close();
    return $success !== false;
}

function get_image_categories(){
    $conn = get_connection();

    $stmt = $conn->prepare("select * from categories");
    $stmt->execute();

    $result = $stmt->get_result();

    $categories = array();
    while($row = $result->fetch_assoc()){
        array_push($categories, $row);
    }

    $stmt->close();
    $conn->close();

    return $categories;
}

function delete_image_category($category_id){
    $conn = get_connection();

    $stmt = $conn->prepare("delete from categories where id = ?");
    $stmt->bind_param('i', $category_id);
    $success = $stmt->execute();

    $stmt->close();
    $conn->close();

    return $success;
}

function create_image($category_id, $alt, $title, $thumb, $full){
    $conn = get_connection();

    $stmt = $conn->prepare("insert into images(category, alt, title, thumb, full) values(?, ?, ?, ?, ?)");
    $stmt->bind_param('issss', $category_id, $alt, $title, $thumb, $full);
    $success = $stmt->execute();

    $stmt->close();
    $conn->close();

    return $success;
}

function update_image($id, $category_id, $alt, $title){
    $conn = get_connection();

    $stmt = $conn->prepare("update images set category = ?, alt = ?, title = ? where id = ?");
    $stmt->bind_param('issi',$category_id, $alt, $title, $id);
    $success = $stmt->execute();

    $stmt->close();
    $conn->close();

    return $success;
}

function get_images($category_id){
    $conn = get_connection();

    $stmt = $conn->prepare("select * from images where category = ?");
    $stmt->bind_param('i', $category_id);
    $stmt->execute();

    $result = $stmt->get_result();

    $images = array();
    while($row = $result->fetch_assoc()){
        array_push($images, $row);
    }

    $stmt->close();
    $conn->close();

    return $images;
}

function delete_image($image_id){
    $conn = get_connection();

    $stmt = $conn->prepare("delete from images where id = ?");
    $stmt->bind_param('i', $image_id);
    $success = $stmt->execute();

    $stmt->close();
    $conn->close();

    return $success;
}

function hash_password($password){
    return hash("sha256", $password . "K1q20mCt");
}