<?php
error_reporting(0);
ob_start(); //打开缓冲区
session_start();

//include('SPDef.php');

$v=$_SESSION['FLVars'];
$v1=$_SESSION['FLV'];
$sn= $_SESSION['GameServerName'];
$name=$_SESSION['gameName'];
$qu=$_SESSION['servId'];
$pay_url=$_SESSION['PayURL'];//参数已经urlencode过了，不要转换为utf-8
$ver = filemtime(__FILE__);//获取该脚本文件的最后修改时间，用于做版本对比

if ( !$v || !$sn )
{
	header('location:'.GetLoginUrl());
}

ob_end_flush();//输出全部内容到浏览器
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="Generator" content="APPNAME VERSION" />
<title><?=$name?>--[双线<?=$qu?>区]</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv=X-UA-Compatible content=IE=EmulateIE7/>

<style>
@charset "gb2312";
* { word-break: break-all; word-wrap: break-word; }
body, th, td, input, select, textarea, button { font: 12px/1.5em Verdana, "Lucida Grande",Arial, Helvetica,sans-serif;background-color:#000; }
body, h1, h2, h3, h4, h5, h6, p, ul, dl, dt, dd, form, fieldset { margin: 0; padding: 0; }
h1, h2, h3, h4, h5, h6 { font-size: 1em; }
ul li { list-style: none; }
html,body {
        height: 100%;
		}
		#game_frame_container,#flashContent {
        height: 94%;
		}
a {color: #2C629E; text-decoration: none; }
a:hover { text-decoration: underline; }
a img { border: none; }
textarea { border: 1px solid #ddd; overflow: auto; }

.t_input { padding: 3px 2px; border: 1px solid #ddd; line-height: 16px; }

.link_td { background: url(/templets/kai/img/hy_2t.jpg); color: #CEC9C9; height: 33px; line-height: 33px; text-align: center; }

.link_td a { color: #3C3C3C; }
.link_td a img{}
.link_tdbox {overflow: hidden;zoom: 1;color: #666;font-family: "微软雅黑";background-color:#eee;}
.link_tdbox div{ float:left; line-height: 35px; height: 35px; overflow: hidden;}
.dqgamelogo{padding-left:15px}
.dqgame{margin: 0px 30px 0px 40px;color: #888;}
.dqgame i{font-style: normal; color:#d70000;}
.dqgame b,.dqgame font{color:#000;font-weight:bold;margin-left:5px}
.dqgame span{color:#08c;margin-left:10px}
.mrdia, .mrdia a { color: #2A8EC9;}
.dqgamefn span{font-family: "宋体";margin: 0px 4px;color: rgb(219, 219, 219);}
.dqgamefn em{font-style: normal;color:#d70000;font-weight:bold}
.dqgamefn {margin-right:20px}
.dqgamefn a{font-weight:bold;color: #BE940C;} 
.dqgamefn a:hover{color:#d70000;text-decoration: none;}
.mrdia{float:right !important; padding-right:15px}
.mrdia:hover{color:#d70000;text-decoration: none;}
.mrdia font{margin: 0px 8px;color:#ddd;font-family: “宋体”;}
.mrdia span{color:#d70000;cursor: pointer;}

/*温馨提示*/
#winpop { width:270px; height:0px; position:absolute; right:0; bottom:0; margin:0; overflow:hidden; display:none; background:#fff url(/statics/images/602wxtsBox.png);z-index:999;}
#winpop .title { line-height: 30px; font-weight:bold; font-size:12px; color: #fff; padding-left: 10px; height: 30px; text-indent: -999em; overflow: hidden; zoom: 1;}
#winpop .con { width:100%;  font-size:12px; color: #000; overflow: hidden; zoom: 1; padding-top: 15px;}
#silu { font-size:12px; color:#666; position:absolute; right:0; text-align:right;line-height:22px;}
#winpop .close { position:absolute; right: 8px; top: 8px; color:#FFF; cursor:pointer; display: block; width: 17px; height: 15px; background: #fff;filter:alpha(opacity=0);-moz-opacity:0.5;
-khtml-opacity: 0;opacity: 0;}
#winpop .con span,#winpop .con b,#winpop .con em,#winpop .con i,#winpop .con a{display:block;line-height:20px; height:20px;font-style: normal;margin:5px 22px;font-weight:300;}
#winpop .con em{color:#08c;font-weight:bold;}
#winpop .con em strong{color:#999;font-weight:300;margin:0px 8px;}
#winpop .con em font{font-weight:300;color:#fb7b00}
#winpop .con i{color:#d70000;}
#winpop .con a {width:200px; height:30px; overflow:hidden;zoom:1; background:url(/statics/images/kjfsdownbtn.png) no-repeat; margin:0px auto; text-indent:-999em; display:block;margin-top: 22px;}
#top_bar{
		background:#000;
		height:24px;
		line-height:24px;
		text-align:right;
		padding-right:20px;
		font-size: 12px;
	}
	#top_bar a{
		color:#fff;
</style>

<script type="text/javascript" src="static/common.js"></script>
<script type="text/javascript" src="static/swfobject.js"></script>
<script type="text/javascript" src="static/rightClick.js"></script>
<script type="text/javascript">

function loaded(){
	var flashVer=_uFlash();
	if(isNaN(parseFloat(flashVer)) || parseFloat(flashVer)<10){
		$('down_flash').style.display='block';
		document.getElementById('flash_down_a').setAttribute('href', flashDown());
		return;
	}
	resize();
	var flashvars = {
		gp:'<?=$v?>',
		ver:<?=$ver?>		};
	var params = {
		allowScriptAccess: "always"}; //需设置该属性为'always'};
	var attributes = {
		id:"gameSwf",
		menu:"false",
		wmode:"window"};
	swfobject.embedSWF("<?=$yxziyuan?>LoadGame.swf?<?=$ver?>", "flashContent", "100%", "100%", "10.0.0", false, flashvars, params, attributes);
	RightClick.init();

}

function resize(){
	var clientH = document.body.clientHeight;
	var navH = $("navBar").offsetHeight;
	$('GameFrameContainer').style.height = (clientH - navH) + "px";
	//alert("clientHeight:" + clientH + ", navHeight:" + navH + ", swfHeight:" + $('swfContainer').style.height);
}

function addBookmark_game()
{
	addBookmark("<?php echo "$t1_name";?>", "<?php echo "$weburl";?>");
}





     

</script>

</head>
<body onload="loaded();">
<div id="navBar" >
	<table  border="0" cellPadding="0" cellSpacing="0"  width="100%" style="position: relative; z-index: 10; height: 30;">

<tr id="602nav">

<td height="30" class="link_td">



<div class="link_tdbox">

	<div class="dqgamelogo"><a href="/" target="_blank"><img src="static/logo.jpg"  height="30" /></a></div>
    <div class="dqgame"><i></i> 您当前正在 <b><?=$name?></b><font>[双线<?=$qu?>区]</font></div>

	<div class="dqgamefn">

    <a href="/" target="_blank">首页</a>

    <span class="pipe">|</span>
    
	<a href="http://127.0.0.1" target="_blank">游戏官网</a>
    <span class="pipe">|</span>
    
    <a href="http://www.u8wan.com" target="_blank">充值</a>

    

    <span class="pipe">|</span>

    <a href="/UserCenter/" target="_blank">用户中心</a>

    <span class="pipe">|</span>

    <a href="/UserCenter/" target="_blank">客服中心</a>
    <span class="pipe">|</span>
        u8wan传奇出品
    <span class="pipe">|</span>
        
    <em><a href="http://www.u8wan.com" target="_blank">www.u8wan.com</a></em>
	</div>

	<div style="float:right; text-align: left;" class="mrdia">[<a href="javascript:;" onclick="AddFavorite('http://127.0.0.1/?f=fav', 'u8wan网页游戏')"><strong>收藏本站</strong></a>]<font>|</font><span onClick="closenav()">[关闭JH60导航]</span></div>

</div>



</td>

</tr>

<tr>
</table></div>
<div style="display:none" id="down_flash">
<center>
<a target="_blank" href="" id="flash_down_a">
<img style="border:0" src="static/warning.jpg" alt="为了您更好体验游戏，请点击下载更新包，安装完成后重新登录" /><br>
为了您更好体验游戏，请点击下载更新包，安装完成后重新登录
</a>
</center>
</div>
<div id="GameFrameContainer"><div id="flashContent"></div></div>
</body>
</html>
<script type="text/javascript">
/*function connectSrv(id, user, pwd)
{
	var nocache = getParams()["nocache"];
	var client = getParams()["client"];
	
	var serverIps=[
	"112.74.206.122",  //1
	];
	var serverPorts=
	[
		13000, 
		13000,
		13000,
		13000,
		13000,
		13000,
		13000,
		13000,
		13000,
		13000,
		13000,
		13000,
		13000,
		13000,
		13000,
		
	];
	
	var serverMaxPorts=
	[
		13000,
		13000,
		13000,
		13000,
		13000,
		13000,
		13000,
		13000,
		13000,
		13000,
		13000,
		13000,
		13000,
		13000,
		13000,
		13000,
		13000,
	];

	var index =id-1;
	var ip= serverIps[index]; //服务器的ip
	var port = serverPorts[index];  //服务器的最小端口
	var portMax = serverMaxPorts[index];  //服务器的最小端口

	var html = '<iframe name="game" scrolling="no" frameborder="0" width="100%" height="100%" '
				+ 'align="left" marginwidth="0" marginheight="0" src="http://112.74.206.122/game/jxgame.php?'
				+ 'srvaddr='+ ip+ '&'
				+ 'srvport='+port+'&'
				+ 'srvportmax='+portMax+'&'
				+ (client != undefined ? 'client=' + client + '&':'') 
				+ 'srvid='+ id +'&'
				+ 'spid=wyi&'
				//+ 'map=2&'
				//+ 'lang=zh-tw&'
				+ 'loadingImgID=0&'
				//+ 'ressite=http://xh.521g.com/miros/wwy/dragon/data/&'
				+ 'ressite=http://112.74.206.122/data/&'
				+ 'rankurl=http://112.74.206.122/game/rankingserver.php&'
				+ 'rechargeURL=http://www.baidu.com&'
				+ 'mediaCardURL=http://www.9377.com/lhzsxsk.html&'
				+ 'officialSiteURL=http://www.baidu.com&'
				+ 'officialForumURL=http://www.baidu.com&'
				+ 'gameName=新传奇&'
				+ 'clienURL=http://www.baidu.com/' + '&'
				+ 'frameRate=30&'
				+ 'platformLotteryURL=http://www.baidu.com/&' 
				+ 'mobile=http://www.baidu.com' + '&'
				+ 'debugClientLang=true' + '&'
				+ 'platformTitle=1' + '&'
				+ 'repus=true' + '&'
				+ 'worldCup =http://www.baidu.com/'
				+ 'famousActivePHP=http://www.baidu.com/' + '&'
				+ 'macip=http%3A%2F%2Fa.clickdata.37wan.com%2Fcontroller%2Fistat.controller.php%3Fitem%3Dnxtj77yerb%26platform%3D37wan%26game_id%3D135%26ext_1%3D%28%3Amacaddress%29%26user_ip%3D%28%3Auser_ip%29%26from%3D%28%3Afrom%29' + '&'
				+ 'user=' + (user != 'undefined' && user != undefined ? user : '') + '&'
				+ 'spverify=' + (pwd != 'undefined' && pwd != undefined ? pwd : 'e10adc3949ba59abbe56e057f20f883e') + '&'
				+ (nocache != undefined ? 'nocache=' + nocache + '&' : '') 				
				+ 't=' + Math.random() + '"></iframe>';
				 
	var container = document.getElementById("flashContent");
	container.innerHTML = html;   
}

function loaded(){
	connectSrv(1,'muying001','e10adc3949ba59abbe56e057f20f883e');
}*/
</script>     