<?php
$serverlisturl= 'ServerList_cq.xml';
$contents = file_get_contents($serverlisturl); 
//$index = $serverindex - 1
$listDoc = simplexml_load_string($contents);
if ( !$listDoc ) die('error load serverlist');
$nodes = $listDoc->xpath('//Server[@index='.$serverindex.']');
if ( !$nodes )
{
	die('serverindex Can not find');
}
$dbuser='smdb';
$dbpwd='123456abc';
$dbhost=$nodes[0]['db'];
//$dbhost=$nodes[$index]['db'];
$db_charset='utf-8';
//$dbname='cq_actor'; 
$dbname=$nodes[0]['database']; 
//$dbname=$nodes[$index]['database']; 

$conn=mysql_connect($dbhost,$dbuser,$dbpwd, 1, 131072);
if (!$conn) {
    die('db error');
}
if (!mysql_select_db($dbname)) {
    die('db error on selected db');
}
mysql_query('set names "'.$db_charset.'"'); 