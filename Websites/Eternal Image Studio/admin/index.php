<?php
    session_start();
    if(!isset($_SESSION['login_stamp'])){
        $_SESSION['login_stamp'] = date('c');
    }
    if (!isset($_SESSION['user']) || !isset($_SESSION['user']['id'])) {
        if (!isset($_SERVER['PHP_AUTH_USER'])) {
            header('WWW-Authenticate: Basic realm="Eternal Image (login at '.$_SESSION['login_stamp'].')"');
            header('HTTP/1.1 401 Unauthorized');
            die('HTTP/1.1 401 Unauthorized');
        }
        $username = $_SERVER['PHP_AUTH_USER'];
        $password = $_SERVER['PHP_AUTH_PW'];

        require_once '../includes/dbtools.php';
        $user = get_user($username, $password);
        if (!$user) {
            header('WWW-Authenticate: Basic realm="Eternal Image (login at '.$_SESSION['login_stamp'].')"');
            header('HTTP/1.1 401 Unauthorized');
            die('HTTP/1.1 401 Unauthorized');
        }
        $_SESSION['user'] = $user;
    }

    require_once '../includes/dbtools.php';
    $image_categories = get_image_categories();
    foreach($image_categories as $key => $category){
        $image_categories[$key]['images'] = get_images($category['id']);
    }
?>
<form action="logout.php">
    <input type="submit" value="Logout"/>
</form>
<form action="add_user.php" method="post">
    <fieldset class="createUser">
        <legend>Create User:</legend>
        <label for="username">Username:</label>
        <input type="text" placeholder="Enter Username" name="username" required>

        <br>
        <br>

        <label for="password">Password:</label>
        <input type="password" placeholder="Enter Password" name="password" required>

        <br>
        <br>

        <label for="confirm_password">Confirm Password:</label>
        <input type="password" placeholder="Confirm Password" name="confirm_password" required>

        <button type="submit">Create User</button>
    </fieldset>

</form>

<form action="update_password.php" method="post">
    <fieldset class="passwordReset">
        <legend>Set A New Password</legend>

        <label for="old_password">Old Password:</label>
        <input type="password" placeholder="Enter Old Password" name="old_password" required>

        <br>
        <br>

        <label for="new_password">New Password:</label>
        <input type="password" placeholder="Enter New Password" name="new_password" required>

        <br>
        <br>

        <label for="confirm_password">Confirm New Password:</label>
        <input type="password" placeholder="Confirm New Password" name="confirm_password" required>

        <br>
        <br>

        <button type="submit">Set New Password</button>
    </fieldset>
</form>

<fieldset>
<legend>Categories</legend>
<table>

    <?php
    foreach($image_categories as $category){
    ?>
    <tr>
        <form action="update_category.php">
            <td><input type="text" name="name" value="<?=$category['name']?>"/></td>
            <td>
                <input type="hidden" name="id" value="<?=$category['id']?>"/>
                <input type="submit" value="Update"/>
            </td>
        </form>
        <form action="delete_category.php">
            <td>
                <input type="hidden" name="id" value="<?=$category['id']?>"/>
                <input type="submit" value="Delete"/>
            </td>
        </form>
    </tr>
    <?php
    }
    ?>
</table>
</fieldset>

<form action="add_category.php">
    <fieldset class="addCategory">
        <legend>Add Category</legend>

        <label for="name">Category Name:</label>
        <input type="text" placeholder="Category Name" name="name" required>

        <br>
        <br>

        <button type="submit">Add Category</button>
    </fieldset>
</form>

<fieldset>
<legend>Images</legend>
<table>
    <tr>
        <th>Category</th>
        <th>Alt Text</th>
        <th>Title Text</th>
        <th>Thumbnail URL</th>
        <th>Watermark URL</th>
    </tr>
    <?php
    foreach($image_categories as $category){
        foreach($category['images'] as $image){
    ?>
    <tr>
        <form action="update_image.php">
            <td>
                <select name="category">
                    <?php
                    foreach($image_categories as $c2){
                        echo '<option value="'.$c2['id'].'"'.($c2['id'] === $category['id'] ? ' selected' : '').'>'.$c2['name'].'</option>';
                    }
                    ?>
                </select>
            </td>
            <td><input type="text" value="<?=$image['alt']?>" name="alt"/></td>
            <td><input type="text" value="<?=$image['title']?>" name="title"/></td>
            <td><a target="_blank" href="<?=$image['thumb']?>"><?=$image['thumb']?></a></td>
            <td><a target="_blank" href="<?=$image['full']?>"><?=$image['full']?></a></td>
            <td>
                <input type="hidden" name="id" value="<?=$image['id']?>"/>
                <input type="submit" value="Update"/>
            </td>
        </form>
        <form action="delete_image.php">
            <td>
                <input type="hidden" name="id" value="<?=$image['id']?>"/>
                <input type="submit" value="Delete"/>
            </td>
        </form>
    </tr>
    <?php
        }
    }
    ?>
</table>
</fieldset>

<form action="add_image.php" method="post" enctype="multipart/form-data">
    <fieldset class="addImage">
        <legend>Add Image</legend>

        <label>Choose a Category</label>

        <select name="category">
            <?php
            foreach($image_categories as $category){
                echo '<option value="'.$category['id'].'">'.$category['name'].'</option>';
            }
            ?>
        </select>

        <br>
        <br>

        <label for="alt">Alt Text:</label>
        <input type="text" placeholder="Alt Text" name="alt" required>
        
        <br>
        <br>

        <label for="title">Title text:</label>
        <input type="text" placeholder="Title Text" name="title" required>

        <br>
        <br>
        
        <input type="file" name="image">
        <input type="submit" value="Upload Image" name="submit">
    </fieldset>
</form>