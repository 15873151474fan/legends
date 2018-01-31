<?php
include('conn_1812.php');
//向运营商发送玩家的实名认证数据
$time_s =time();
//include('SPDef.php');

$User=addslashes(trim($_GET['user']));
$Name=addslashes(trim($_GET['name']));
$CID=addslashes(trim($_GET['cid']));
$ServerId=addslashes(trim($_GET['serverindex']));

$ServerId=$ServerId - SERVERIDBASE;
$User=substr($User, 0, strlen($User) - strlen(SPID) - 1);

$key='treyuwwe64*&DSwssieq';
$Sign = md5($Name.$User.$key.$CID);

//修改用户的id
$sql="update globaluser set identity='{$CID}' where account='{$User}'";
$ret = mysql_query($sql);

if($ret){
	//获取返回值
	$result = file_get_contents('http://192.168.1.250/game/fcm_actions.php?account='.urlencode($User).'&truename='.urlencode($Name).'&card='.urlencode($CID).'&sign='.$Sign);

	echo $result;
}
      


?>
