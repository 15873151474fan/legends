<?php
include('conn_1812.php');
$account=trim($_GET['username']);
$passwd=123456;
$ID=isset($_GET['ID']) ? $_GET['ID'] : ''  ;   //合作方玩家id
$accountID=isset($_GET['accountID']) ? $_GET['accountID'] : '' ;    //u8wan 注册的id
$adID=isset($_GET['adID']) ? $_GET['adID'] : '';   //广告id 

//http://112.74.206.122/game/webgame/reg.php?username=xiaosi

//注册账号
$sql="insert into globaluser (`account`,`passwd`)values('".$account."','".md5($passwd)."')";
if(mysql_query($sql,$conn)){
	echo 1;exit;
}else{
	echo 0;exit;
}

	
?>