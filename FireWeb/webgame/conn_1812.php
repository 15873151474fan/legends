<?php
$dbuser='Admb';
$dbpwd='123456abc';
$dbhost='192.168.10.228';
$db_charset='utf-8';
$dbname='cq_account';


$conn=mysql_connect($dbhost,$dbuser,$dbpwd, 1, 131072);
if (!$conn) {
    die('db error');
}
if (!mysql_select_db($dbname)) {
    die('db error on selected db');
}
mysql_query('set names "'.$db_charset.'"');