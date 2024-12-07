<?php
$con = new mysqli('db', 'root', 'password', 'users_app');
if ($con->connect_error) {
    die("Connection failed: " . $con->connect_error);
}
?>
