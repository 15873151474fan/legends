<?php

$dbuser='root';
$dbpwd='123456abc';
$dbhost='127.0.0.1';
$db_charset='utf-8';
$dbname='db_game_log';

$conn=mysql_connect($dbhost,$dbuser,$dbpwd, 1, 131072);
if (!$conn) {
    die('db error');
}
if (!mysql_select_db($dbname)) {
    die('db error on selected db');
}
mysql_query('set names "'.$db_charset.'"');