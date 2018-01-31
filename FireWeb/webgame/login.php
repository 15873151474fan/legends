<?php
ob_start(); 
$username=addslashes(trim(urldecode($_GET['account'])));
$LoginVerify=$_REQUEST['password'];
$ServerId=addslashes(trim(urldecode($_GET['serverid'])));
$Adut=addslashes(trim(urldecode($_GET['fcm'])));
$pFlag=addslashes(trim(urldecode($_GET['sign'])));
$client=addslashes(trim(urlencode($_GET['client'])));
$spid=addslashes(trim(urlencode($_GET['spid'])));
$time=$_GET['time'];
$pTime=time();


if (!$username || !$ServerId || ($Adut == NULL) || !$pTime || !$pFlag) {
    die('param error');
}

include('../configuration/config.inc.php');

//echo $username.'||'.$ServerId.'||'.$spid.'||'.$InterfaceKey.'||'.$time;exit;

$flag_plant=md5($username.$ServerId.$spid.$InterfaceKey.$time);
if($pFlag !=$flag_plant){
	echo -1;exit;    
}         
           
$login_name = $username;   
//$login_name = $username.'_'.$spid;      
//$login_name=$username;
//$login_name='muying022';
$Adut = ($Adut == 1) ? "000000198001010000" : "";
$ServerId = $ServerId + SERVERIDBASE;

include('conn_1812.php');
//echo $login_name.'||||'.md5($LoginVerify).'||||||'.$ServerId.'|||||'.$Adut;exit;
$sqlRet = mysql_query('call djimportspuser("'.$login_name.'", "'.md5($LoginVerify).'",'.$ServerId.',"'.$Adut.'")');

$row = mysql_fetch_array($sqlRet);      
$RepUS = ($row[0] == '2') ? "true" : "false";        
mysql_close();

session_start();         

$_SESSION['LoginUser']=$login_name;
$_SESSION['LoginVerify']=md5($LoginVerify);
$_SESSION['ServerId']=$ServerId;
$_SESSION['PayURL']=$PayURL;
$_SESSION['RepUS']=$RepUS;
$_SESSION['client']=$client;
$_SESSION['spid']=$spid;
$_SESSION['time']=$time;
//$_SESSION['flag']=$flag_back;
$_SESSION['flag']=$pFlag;





if($_SESSION['client']==2){
	$LoginUser=$_SESSION['LoginUser'];
	$LoginVerify=$_SESSION['LoginVerify'];
	$ServerId=$_SESSION['ServerId'];
	$SPID=$_SESSION['SPID'];
	$PayURL=$_SESSION['PayURL'];
	$RepUS=$_SESSION['RepUS'];
	$ttime=$_SESSION['time'];
	$flag=$_SESSION['flag'];
	$spid=$_SESSION['spid'];

	$configDoc = simplexml_load_file('GameConfig.xml');

	if ( !$configDoc ) die('error load GameConfig');
	$nodes = $configDoc->xpath('//Server[@id='.$ServerId.']');
	if ( !$nodes )
	{
		die('未配置指定的服务器数据');
	}
	$serverNode = $nodes[0];
	//循环取得合并的最终服务器
	while ($serverNode['mergedto'] != 0)
	{
		$nodes = $configDoc->xpath('//Server[@id='.$serverNode['mergedto'].']');
		if ( !$nodes )
		{
			die('未配置指定的服务器数据');
			break;
		}
		$serverNode = $nodes[0];
	}
	$_srvAddr=(string)$serverNode['serveraddr'];
	$_srvPort=(string)$serverNode['serverport'];
	$_srvName=(string)$serverNode['name'];
	$_srvId=(string)$serverNode['id'];
	$_resSite=(string)$serverNode['ressite'];
	$_rankServer=(string)$serverNode['rankserver'];
	$_payUrl=str_replace('&', ';', $PayURL);
	$rechargeURL=(string)$serverNode['rechargeURL'];
	$mediaCardURL=(string)$serverNode['mediaCardURL'];
	$officialSiteURL=(string)$serverNode['officialSiteURL'];
	$clienURL=(string)$serverNode['clienURL'];
	$officialForumURL=(string)$serverNode['officialForumURL'];
	$platformLotteryURL=(string)$serverNode['platformLotteryURL'];
	$mobile=(string)$serverNode['mobile'];

	//u8wan充值地址
	$pay_url='http://pay.u8wan.com/?game_id=myzs&server_id=1&player='.$LoginUser;

	$gameName = $t1_name;                              
	$key='differofzjcqha';
	$flash_vars="srvaddr=".$_srvAddr."&srvport=".$_srvPort."&time=".$ttime."&sessionKey=".$key."&sign=".$flag."&srvid=".$_srvId."&spid=".$spid."&loadingImgID=0&ressite=".'http://'.$_srvAddr.'/'.$_resSite."&rankurl=".$_rankServer."&payurl=".$pay_url."&map=2&user=".$LoginUser."&spverify=".$LoginVerify."&gameName=".$gameName."&lang=".LANGUAGE."&repus=".$RepUS."&platformLotteryURL=".$platformLotteryURL."&frameRate=60&homeURL=".$weburl."&forumURL=".$weburl.'&client='.$_SESSION['client'].'&clienURL='.$clienURL.'&connectPort=9898'.'&clientversionz='.$_SESSION['client'];

	//针对参数进行xor简单加密,FLASH中需要做对应的解密,这样避免查看源文件得到这些敏感信息,如不需要加密则屏蔽下面这行
	//解密时,先base64_decode再与 $key 做异或运算

	$flash_vars1="srvaddr=".$_srvAddr."&srvport=".$_srvPort."&srvportmax=".$_srvPort."&srvid=".$_srvId."&spid=".$spid."&loadingImgID=0&ressite=".'http://'.$_srvAddr.'/'.$_resSite."&rechargeURL=".$rechargeURL."&mediaCardURL=".$mediaCardURL."&officialSiteURL=".$officialSiteURL."&officialForumURL=".$officialForumURL."&rankurl=".$_rankServer."&payurl=".$pay_url."&map=2&user=".$LoginUser."&spverify=".$LoginVerify."&gameName=".$gameName."&lang=".LANGUAGE."&repus=".$RepUS."&frameRate=60&platformLotteryURL=".$platformLotteryURL."&mobile=".$mobile."&homeURL=".$weburl."&forumURL=".$weburl.'&client='.$_SESSION['client'].'&clienURL='.$clienURL.'&connectPort=9898'.'&clientversionz='.$_SESSION['client'];


	function sampleEncodeParam($s)        
	{
		$hexchars = '0123456789ABCDEF';
		if ( !$s || strlen($s) <= 0 )
		{
			echo "null string.";
			return "";
		}                
		$len = strlen($s);
		$ret = '';
		$curc = 0;
		$nextc = ord(substr($s, 0, 1));
		for ($i=1; $i<$len; $i++ )
		{
			$curc = $nextc;
			$nextc = ord(substr($s, $i, 1));
			$curc ^= $nextc;
			//echo '<br> 0x'. substr($hexchars, ($curc & 0xF0) >> 4, 1) . substr($hexchars, $curc & 0x0F, 1);
			$ret .= substr($hexchars, ($curc & 0xF0) >> 4, 1);
			$ret .= substr($hexchars, $curc & 0x0F, 1);
		}
		$curc = $nextc ^ 0x7C;
		$ret .= substr($hexchars, ($curc & 0xF0) >> 4, 1);
		$ret .= substr($hexchars, $curc & 0x0F, 1);
		return $ret;
	}

	$flash_vars=base64_encode(sampleEncodeParam($flash_vars));



   	header("Content-type:text/xml");
	$ver=filemtime('../LoadGame.swf');
	$asynUrl='http://112.74.206.122/game/webgame/login.php?account='.$LoginUser.'&password='.$LoginVerify.'&serverid='.$ServerId.'&fcm=1&time='.$ttime.'&spid='.$spid.'&client=2&sign='.$pFlag.'&connectPort=9898&clientversionz=2';
	
	//GameFrame.swf       
	$xml='<?xml version="1.0" encoding="UTF-8" ?> 
            <root>
	<flashVars>'.$flash_vars.'</flashVars>         
	<ver>'.$ver.'</ver> 
	<mainUrl>http://myzs.u8wan.com/</mainUrl> 
	<payUrl>http://pay.u8wan.com/?game_id=myzs</payUrl> 
	<bbsUrl>http://bbs.u8wan.com/</bbsUrl> 
	<kfUrl>http://myzs.u8wan.com/server.html</kfUrl> 
	<cdnUrl>http://112.74.206.122/data/</cdnUrl> 
	<asynUrl>'.htmlspecialchars($asynUrl).'</asynUrl> 
	<loadGameSwf>http://112.74.206.122/data/GameFrame.dat</loadGameSwf> 
	</root>';                      
    	echo $xml;                                                      
     	exit;                   
}







header('location:game.php');

ob_end_flush();
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
}
window.onbeforeunload = function()
{
	return "<?=$t1_name?>ÓÎÏ·Ò³Ãæ";
}
</script>
</head>
<body onLoad="onload()">
</body>

<script type="text/javascript">
</script>

</html>