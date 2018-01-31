<?php
$WebTitle='暮影战神';                         //网站标题
$weburl='http://127.0.0.1/';         //推广地址头
$tgyuanbao='1000';                       //每个推广获得元宝数
$db_type='mysql';                         //数据类型
$db_charset='utf8';                       //编码
$db_host='192.168.10.228';                     //数据库地址
$db_username='root';                      //数据库用户名
$db_password='123456abc';                  //数据库密码
// $database='web';                          //网站数据库
$database='cq_actor';
$database2='cq_account';                        //游戏数据库
$database3='cq_log';
$database4='cq_locallog';                        //游戏数据库
$duihuan=1;  //兑换开关 1开 非1 关
$free=1;  //注册送元宝开关 1开 非1 关
$sendmail =1;
$ku_houzhui="_1";                  //游戏数据库
$lv='1';                                 //推广到达等级
$kg='1';                                  //游戏是否开启，1：开启，0：没有开启
$maxnum="100";                            //单个IP最大注册次数
$InterfaceKey = '702042941817d99ec8625d4deea81043';     //登录密钥
define('SERVERIDBASE', 0);
define('LANGUAGE', 'zh-cn');
define('LOGINURL','http://127.0.0.1/');
$qq='合肥传奇出品 www.52pk.pw  '; //客服QQ、YY等
$chongzhi='http://127.0.0.1:8008/'; //服务端接收充值地址
//////资源地址设置
//$yxziyuan='http://cdn.ah.9377.com/937/v5/';
//$yxziyuan='http://cdn4.ahtl.521g.com/v1/';        //资源地址
$yxziyuan1='/data/';        //资源地址
$yxziyuan='/data/';   
$rankServer='/webgame/rank/rankingserver.php';
$fpVersionURL='/webgame/fpversion.php';
$PayURL='/pay.php';      //充值地址
$yxdlq='/new.exe';      //充值地址
$RepUS='http://127.0.0.1/';   
$yxip='127.0.0.1';                   //游戏IP
$yxduankou='13000';                   //游戏端口

//GM api配置 元宝即时到帐
//$ServerId = '1';
// $spid = '49you';

$t1_gameid='s1';

$t1_name='暮影战神.u8wan1区';
$gmapi = "http://127.0.0.1";
$gmapiport = "4001";

//GM api配置
$sqlhost='';
$sqldb='';
$sqlname='';
$sqlpass='';



$tgurl="";
if(empty($tgurl)) $url_this = 'http://'.$_SERVER['SERVER_NAME'].$_SERVER["REQUEST_URI"];

else $url_this =$tgurl;
$conn = @mysql_connect("$db_host","$db_username","$db_password") or die ("数据库连接出错，请联系管理员 。");
@mysql_select_db("$database",$conn) or die ("数据库表不存在或者未连接。请联系管理员 。");
//mysql_query("set names UTF8"); //使用文件编码，防止出错

function getIP()
{
if(!empty($_SERVER["HTTP_CLIENT_IP"]))
   $ip = $_SERVER["HTTP_CLIENT_IP"];
else if(!empty($_SERVER["HTTP_X_FORWARDED_FOR"]))
   $ip = $_SERVER["HTTP_X_FORWARDED_FOR"];
else if(!empty($_SERVER["REMOTE_ADDR"]))
   $ip = $_SERVER["REMOTE_ADDR"];
else
   $ip = "无法获取！";
   if(is_ip($ip)) return $ip;
   if(is_ip($_SERVER['HTTP_CLIENT_IP'])) return $_SERVER['HTTP_CLIENT_IP'];
   if(is_ip($_SERVER['REMOTE_ADDR'])) return $_SERVER['REMOTE_ADDR'];
   return 'hey sb~';
}


function is_ip($ip) {
	return preg_match("/^([0-9]{1,3}\.){3}[0-9]{1,3}$/", $ip);
} 

function passport_encrypt($txt, $key) { 
srand((double)microtime() * 1000000); 
$encrypt_key = md5(rand(0, 32000)); 
$ctr = 0; 
$tmp = ''; 
for($i = 0;$i < strlen($txt); $i++) { 
$ctr = $ctr == strlen($encrypt_key) ? 0 : $ctr; 
$tmp .= $encrypt_key[$ctr].($txt[$i] ^ $encrypt_key[$ctr++]); 
} 
return base64_encode(passport_key($tmp, $key)); 
} 

function passport_decrypt($txt, $key) { 
$txt = passport_key(base64_decode($txt), $key); 
$tmp = ''; 
for($i = 0;$i < strlen($txt); $i++) { 
$md5 = $txt[$i]; 
$tmp .= $txt[++$i] ^ $md5; 
} 
return $tmp; 
} 

function passport_key($txt, $encrypt_key) { 
$encrypt_key = md5($encrypt_key); 
$ctr = 0; 
$tmp = ''; 
for($i = 0; $i < strlen($txt); $i++) { 
$ctr = $ctr == strlen($encrypt_key) ? 0 : $ctr; 
$tmp .= $txt[$i] ^ $encrypt_key[$ctr++]; 
} 
return $tmp; 
}

function sysmd5($str,$key='',$type='sha1'){
	$key =  $key ?  $key : '702042941817d99ec8625d4deea81043';
	//return $key;
	return hash ( $type, $str.$key );
} 
function GetLoginUrl()
{
  return LOGINURL;
}
?>
