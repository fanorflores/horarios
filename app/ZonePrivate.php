<?php
include_once("UsersSesions.php"); 
$uss=new UsersSesions();
$logged=false;
if(isset($_SESSION['usertag']))
{
  $logged=true;
 
}
else
{
    header("Location: login.php");
    $logged=false;
}
?>