<?php
ini_set("error_reporting","E_ALL & ~E_NOTICE");
include_once "../configuration/config.inc.php";
if(!$_SESSION['accountName']) exit("<script>location.href='/UserCenter/Login.php';</script>");
//$area_url = array($chongzhi);
$sqlr="SELECT dj FROM $database.user WHERE login_account='".$_SESSION['accountName']."' "; 
$result=mysql_query($sqlr,$conn);
$row8=mysql_fetch_array($result);
$dj1  = intval($row8['dj']);
$nums=intval($_GET['nums']);
//echo $nums;
if($row8['dj']<=0){
	echo "<script> alert('没有可兑换点数！');location.href='/UserCenter/index.php';</script>";
	exit;
}
if($nums<=0){
	echo "<script> alert('兑换点数不能小于等于0！');location.href='/UserCenter/index.php';</script>";
	exit;
}
if($row8['dj'] < $nums){
	$nums=$row8['dj'];
} 

$exec1 = "select * from $database3.`am` where `account`='{$_SESSION['accountName']}_{$spid}'";
$result1 = mysql_query($exec1,$conn);
$rowabcde = mysql_fetch_array($result1);
//echo $exec1;
if ($rowabcde['userid']!="") {
$sqlw="UPDATE $database.`user` SET `dj`=`dj` - ".$nums." WHERE `login_account`='{$_SESSION['accountName']}'"; 
//echo $sqlw;
@mysql_query($sqlw,$conn);
	
  $execb = "update $database3.`am` set `amount`=`amount` + ".$nums." where `account`='{$_SESSION['accountName']}_{$spid}'";
  $resultb = mysql_query($execb,$conn);

echo "<script> alert('兑换元宝成功！');location.href=/UserCenter/;</script>";
//echo "<script> location.href=/UserCenter/;</script>";
}else{ echo "<script> alert('请先创建角色后再进行兑换操作！');location.href=/UserCenter/;</script>";}
?>