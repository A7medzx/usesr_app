<?php
$con=new mysqli('localhost','root','','user_app');
if(!$con){
    die(mysqli_error($con));
}