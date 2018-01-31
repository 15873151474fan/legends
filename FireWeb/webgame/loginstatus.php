<?php
$serverindex=$_REQUEST['serverindex'];
$status=$_REQUEST['status'];

if (!$serverindex || !$status) {
    die('param error');
}

include('conn_log.php');

mysql_query("INSERT INTO gstatic.loginstatus (serverindex,status,increment,staticdate) VALUES ({$serverindex},{$status},1,NOW()) ON DUPLICATE KEY UPDATE increment=increment+1");
 
mysql_close($conn);    

?>