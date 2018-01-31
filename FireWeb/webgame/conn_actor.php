<?php
$dbuser='root';
$dbpwd='123456';
$dbhost='112.74.206.122';
$db_charset='utf-8';
$dbname='cq_actor';


$conn2=mysql_connect($dbhost,$dbuser,$dbpwd, 1, 131072);
if (!$conn2) {
    die('db error');
}
if (!mysql_select_db($dbname)) {
    die('db error on selected db');
}
mysql_query('set names "'.$db_charset.'"');