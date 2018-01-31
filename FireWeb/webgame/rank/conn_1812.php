<?php
$serverlisturl = '/ServerList.xml';
$contents = file_get_contents ( $serverlisturl );

$listDoc = simplexml_load_string ( $contents );
if (! $listDoc)
	die ( 'error load serverlist' );
$nodes = $listDoc->xpath ( '//Server[@index=' . $serverindex . ']' );
if (! $nodes) {
	die ( 'serverindex Can not find' );
}

$dbuser = 'root';
$dbpwd = '123456abc';
$dbhost = '127.0.0.1';
$db_charset = 'utf-8';
$dbname = 'cq_actor';

// $dbhost=gethostbyname($dbhost);

$conn = mysql_connect ( $dbhost, $dbuser, $dbpwd, 1, 131072 );
if (! $conn) {
	die ( 'db error' );
}
if (! mysql_select_db ( $dbname )) {
	die ( 'db error on selected db' );
}
mysql_query ( 'set names "' . $db_charset . '"' ); 