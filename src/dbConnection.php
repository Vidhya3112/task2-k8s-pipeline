<?php
$host		= "104.197.186.64";      
$username	= "root";
$password	= "root"; 
$db_name	= "quiz1"; 

$con = mysqli_connect($host, $username, $password,$db_name);

if (mysqli_connect_errno())
{
    echo "Failed to connect to MySQL: " . mysqli_connect_error();
    //you need to exit the script, if there is an error
    exit();
}
else
{
}
?>
