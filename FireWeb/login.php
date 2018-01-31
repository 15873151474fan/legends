<?php
ob_start(); //打开缓冲区 
$username=addslashes(trim(urldecode($_GET['account'])));
$LoginVerify=$_REQUEST['password'];
$LoginVerify=base64_decode(rawurldecode($LoginVerify));
//$password=addslashes(trim(urldecode($_GET['password'])));
$ServerId=addslashes(trim(urldecode($_GET['ServId'])));
$Adut=addslashes(trim(urldecode($_GET['fcm'])));
$pFlag=addslashes(trim(urldecode($_GET['sign'])));
$client=addslashes(trim(urlencode($_GET['client'])));//是否为客户端登陆
$pTime=time();
if (!$username || !$ServerId || ($Adut == NULL) || !$pTime || !$pFlag) {
    die('param error');
}

include('../configuration/config.inc.php');
//验证flag参数
//$flag_plant="Uname=".$username."&ServerId=".$ServerId."&Key=".$InterfaceKey."&Time=".$pTime;
//$flag_black=md5($flag_plant);
$flag_plant="account=".$username."&ServId=".$ServerId."&Spid=".$spid."&Key=".$InterfaceKey."&Time=".$pTime;
$flag_back=md5($$flag_plant);


$login_name = $username.'_'.$spid;
$Adut = ($Adut == 1) ? "000000198001010000" : "";
$ServerId = $ServerId + SERVERIDBASE;

include('conn_1812.php');

$sqlRet = mysql_query('call djimportspuser("'.$login_name.'", "'.md5($LoginVerify).'",'.$ServerId.',"'.$Adut.'")');
$row = mysql_fetch_array($sqlRet);
$RepUS = ($row[0] == '2') ? "true" : "false";
mysql_close();

session_start();
$_SESSION['LoginUser']=$login_name;
$_SESSION['LoginVerify']=md5($LoginVerify);
$_SESSION['ServerId']=$ServerId;
$_SESSION['SPID']=$spid;
$_SESSION['PayURL']=$PayURL;
$_SESSION['RepUS']=$RepUS;
$_SESSION['client']=$client;
$_SESSION['time']=$pTime;
$_SESSION['flag']=$flag_back;

header('location:game.php');

ob_end_flush();//输出全部内容到浏览器 
?>

<html>
<head>
<style type="text/css">
<!--
html,body {
    height:100%;
}
*{ margin:0px; padding:0px;}
-->
</style>

<script language="javascript" type="text/javascript">
function onload()
{
	self.moveTo(0,0);
	self.resizeTo(screen.availWidth,screen.availHeight);
	//document.location.href='GameConfig.php';
}
window.onbeforeunload = function()
{
	return "<?=$t1_name?>游戏页面";
}
</script>
</head>
<body onLoad="onload()">
</body>

<script type="text/javascript">
</script>

</html>