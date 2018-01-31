<?php
$serverlisturl= 'ServerList_cq.xml';
$contents = file_get_contents($serverlisturl); 

$listDoc = simplexml_load_string($contents);
if ( !$listDoc ) die('error load serverlist');
$nodes = $listDoc->xpath('//Server[@index='.$serverindex.']');
if ( !$nodes )
{
	die('serverindex Can not find');
}

$dbuser='sdmb';
$dbpwd='123456abc';
$dbhost=$nodes[0]['db'];
$db_charset='utf-8';
//$dbname='cq_actor'; 
$dbname=$nodes[0]['database']; 

$conn=mysql_connect($dbhost,$dbuser,$dbpwd, 1, 131072);
if (!$conn) {
    die('db error');
}
if (!mysql_select_db($dbname)) {
    die('db error on selected db');
}
mysql_query('set names "'.$db_charset.'"'); 