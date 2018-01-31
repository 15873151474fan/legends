<?php
$sVer=$_REQUEST['ver'];

if (!$sVer) {
    die('param error');
}

include('conn_log.php');

mysql_query("insert into gstatic.fpversion values('{$sVer}', 1, Now()) on duplicate key update count=count+1");
 
mysql_close($conn);    

?>