<?php 
  include_once "../configuration/config.inc.php";
   if(!$_SESSION['accountName']) exit("<script>location.href='../UserCenter/Login.php';</script>");
   define('IN_SYSTEM',true);
   $LoginUser=$_REQUEST['account'];
   $LoginUser=base64_decode(rawurldecode($LoginUser));
   $LoginVerify=$_REQUEST['password'];
   $LoginVerify=base64_decode(rawurldecode($LoginVerify));
   $ServerId=$_REQUEST['ServId'];
   $sign=$_REQUEST['sign'];
   $SPID=$_REQUEST['Spid'];
   //$PayURL=$_REQUEST['PayURL'];
   //$PayURL=base64_decode(rawurldecode($PayURL));
   //$RepUS=$_REQUEST['RepUS'];
   //$RepUS=base64_decode(rawurldecode($RepUS));
   //$_payUrl=str_replace('&', ';', $PayURL);
   $ver = filemtime(__FILE__);
   define('LANGUAGE', 'zh-cn');
   $gameName = $WebTitle;
   $key='differofzjcqha';
   $flash_vars="srvaddr=".$yxip."&srvport=".$yxduankou."&loginHost=".$yxip."&cbppack=0&srvportmax=13000&&srvid=".$ServerId."&ip1=123456&spid=".$SPID."&ressite=".$yxziyuan."&map=2&rankurl=".$rankServer."&payurl=".$PayURL."&user=".$LoginUser."&spverify=".md5($LoginVerify)."&gameName=".$gameName."&lang=".LANGUAGE."&repus=".$RepUS."&frameRate=60&homeURL=".$weburl."&forumURL=".$weburl.'&client='.$_SESSION['accountName'].'&clienURL='.$yxdlq;
   $flash_vars1="srvaddr=".$yxip."&userLine=1&sessionKey=".$key."&sign=".$sign."&srvport=".$yxduankou."&cbppack=0&srvportmax=13000&&srvid=".$ServerId."&ip1=123456&spid=".$SPID."&ressite=".$yxziyuan."&map=2&lang=".LANGUAGE."&platformLotteryURL=".$weburl."&serverindex=1&fpVersionURL=".$fpVersionURL."&rechargeURL=".$PayURL."&rankurl=".$rankServer."&protectURL=".$weburl."&saveGameURL=".$weburl."&user=".$LoginUser."&spverify=".md5($LoginVerify)."&gameName=".$gameName."&repus=".$RepUS."&frameRate=60&homeURL=".$weburl."&forumURL=".$weburl.'&client=0&clienURL='.$yxdlq;				
			
  
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

//echo $flash_vars;
$flash_vars=base64_encode(sampleEncodeParam($flash_vars));
$flash_vars1=base64_encode(sampleEncodeParam($flash_vars1));
//$dfv='MTYxNzA0MTMxNzFCMDcwQTAxMUQ0NTBFMDYwNTE2NTUwMTA0MDYxRjFEMDY0OTBDMDIwMzAwMDExNzU1MDEwNDA2MUYxRDA2MTkwQzE5NDUwQzAyMDMwMDAyMTQ0NzBEMDUwODEyMkMyQzE2MTcwNDEzMTcyRDM2MEQ1OTBFMDUwNjE2NTUwMzE5MEQ1OTA0MEEwNDExNTQxNzE2MDAxQTFEMTE1ODU1MUMwMDA0NEExNTAwNEMwNzBBNDA0RjA5NDYxNzBBMDQwMDE5NEQwQzAyNDIxNjBBMDQxODU5NDcxRTA5NTQxMzBGMDUxRTA3MUU1MTU1MUMwMDA0NEExNTAwNEMwRjFGNUQ0RjA5MUMxODQyMUIwNzAzNTY0OTREMEMwMjQyNUQxMzBGMDU0NTVFMTgxODU2NTYxMTE4MEMwNzFFNTE1NTFDMDAwNDU1MTY3MjY0MTc3NDYzMTc3NDMxMDAwMDU5MTcwQTA0MDAxOTREMEMwMjQ4MTc3NDM2MTExODI2MzYwNzBBMDExRDU2NUUxODE4NTUxNjc1MjEwNjBDMDg0MDE2NzcyNTA5MUMxODQ5MTcwNDQ1MTYxNzA0MTMxNzU3MTY3Nzc3MDYwNTE1MTcwNDQzMUIwRjBDMDg0MDE2NzczQzAwMDAwMDE1MTQwQjA2MTE0MzUzMDYxNjE3NEY0NTAwMDAwMDE1MTQwQjA2MTEzQTY2MEEwNDExNEEwRDBGMDk1QTQ3MTI0NTRFMEQ0ODU0MTcxNTA1MDY0RTQ5MDYwNzEwNDM0MDE0MTMwQzA4MzczMzE1MTE1ODBCMDYxNjRFMDcwMjA4MzAwNzFFNzE1NTFDMDAwNDRBMTUwMDRFMDk0NjE3MEEwNDAwMTk0RDBDMDI0MjA5NDUwRjA1MEMwQjFBNDkwRDE2NDUwRjA1MEMwQjNCMDcxRTcxNTUxQzAwMDQ0QTE1MDA0QjBCMTgxOTQwNEYwOTQ2MTcwQTA0MDAxOTREMEMwMjQyMTYwQTA0MTgxNjBBMDQwMDEyNjA3MzEzMUM3ODY0MUMwRTEyNjA3QzFDNjcwMDY3MUMwODE0NjA3MDEwNjc3MzE0NjQ3MTE1NjA3QzFDNjcwNzYwMUMwMDFDNjA3MDEwNjcwNzYwNjQwNDYwNjA3MjEyNjQwMzY3NjQwNzY4NEIxRDFENDM0RjE5NDEwQzBDMDAwODE3MUYwNTAyMTgxQzAyMDExRjFDMDEwQTFGNEYxOTQyMEYwQzAwMDMxQzE3MDkxRTFDMDAwNTE5MUMwMTBBMUY1NjAyMUQxQjExMDYxNzIxMDcxRTcxNTUxQzAwMDQ0QTE1MDA1ODAwMDA1OTE3MEEwNDAwMTk0RDBDMDI0MjVBMDYxNjE3MDE1QzVBMDYxNjE3MDEyQzM2MDcwQTAxMUQ1NjVFMTgxODRGNEIwRDA5MTU1ODBFMTU0QjBDMTE0RDBGMTQ1MzA2MTYxNzNFMjUwNzBCNTgwQzE3NDgwMTBFMTQwMTFCNTIxMDFDMTc0QTAzMEUwNTBEMDcwOTJFMjQwQTJFMEQ3OTBEMTY1NTE2MTYwMDFBMDYwMTI1MkUxQzQ0MDUwQjAzMDYwNTA2NTYwMTUzMDI1MDVBMEEwQjBENTEwMTVDNUY1MTU0NTUwRTU5MDIwNTU0MDMwNzA2MDEwOTFFNTIxRDA0MDg1ODBDMDUwNTAxMDMwNTBFMDAwOTA2MTE1NTAxMDQxNzA1MDAxNjRGMUI1NTAzMDYxMzE3MUIwRjFGNDQwRTU3NTUwOTBFMEUwODA0MDEwNjA3MDcwNDA3NTM1MDUwNUIwOTA2NTMwNjUyMDUwMzA1NTU1NjU1NTEwMjA3MTc1NjE4MTgyMzAyMUQxOTA3MUU3MTU1MUMwMDA0NEExNTAwNEUxMTE5NDc0RjA5MUMxODQyMUIwNzAzNTY0OTREMEMwMjQyNEUwMjE3MUQxRjEzNEE0QTEzMTcwRDE5MTQxNTExNEE0RTAyMTcxQjFEMTcxMzE3MEQxOTE0MTUxMTQzNEIwODAxMEQwODIyMjIxMzE2MzEwNzFFNzE1NTFDMDAwNDRBMTUwMDU4MDAwMDU5MTcwQTA0MDAxOTREMEMwMjQyNEUwOTFDMTgxNDBCMTg0NTQ2MUMxOTAxNEE0MTA2MEMwODJCMkYwQzA4NTgwNDBBMDQwMEQxN0MwRDdFNTIyQTc0NTQxMTQ5NTcyN0I5QzU2QTAzNkI1RDA1RTQ2ODA2MDUxRDFFMDYwNzZENkMwNjAxNkI2QzA2MDMxQjFFMDYwMjY4NkMwNTA2MUQxRTA1MDc2Q0JCNzMyNTU2NkIyMzRBNUUyODdCNjkxQTdGNjkzNjlDNTIxQjA0MEUwQjUzMUI0RjBEMDEwQjFBMUQxRDBENDQwOTA3MDMwNDBDMDkwMDA4MDEwOTAwMDMwMzAwMDIwMTA3MDMxMDRGMUEyQzNFMDUxMTE5MTg0OTBDMTc0MDA1MEUzMjJBMDcxRTUxNTUxQzAwMDQ0QTE1MDA1ODAwMDA1OTE3MEEwNDAwMTk0RDBDMDI0MjVBMDYxNjE3MDE1QzVBMDYxNjE3MDEyQzM2MDcwQTAxMUQ1NjVFMTgxODRGNEIwRDA5MTU1ODBFMTU0QjAyMEQwQjA1MDk1ODU1MUMwMDA0NEExNTAwNEUwOTQ2MTcwQTA0MDAxOTREMEMwMjQyNUYxODA3MDEwQjRBNDYwNzBBMDExRDU2NUUxODE4NTY1NTA1MUYxOTREMEMxNzU1MUEwRTA5NTM1RjU1NTI1MzA3NTMwNDU2MDkwMTVDMDcwNzUwMDMwNDUyNTYwNzU2MDIwNjA3MDM1NzU1MDc1NzA3NTI1MzA3MTM1NjFDMEQxNTEyMDkxRDFGMzkzRDFEMTgwOTU4MEMxNzVB';
//$dfvv=base64_decode(sampleEncodeParam($dfv));
//echo '<br>';
//echo $flash_vars;
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="Generator" content="APPNAME VERSION" />
<title><?php echo "".$t1_name."";?></title>
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
		#game_frame_container,#flash_content {
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

<script language="javascript" src="static/jquery.js"></script>
<script language="javascript" src="static/swfobject.js"></script>
<script language="javascript" src="static/common.js"></script>
<script language="javascript" src="static/right_click.js"></script>

</head>
<body scroll="no" >
<div id="game_frame_container">
<table  border="0" cellPadding="0" cellSpacing="0"  width="100%" style="position: relative; z-index: 10; height: 30;">

<tr id="602nav">

<td height="30" class="link_td">



<div class="link_tdbox">

	<div class="dqgamelogo"><a href="/" target="_blank"><img src="logo.jpg"  height="30" /></a></div>
    <div class="dqgame"><i></i> 您当前正在 <b>创世三国</b><font>[双线1区]</font></div>

	<div class="dqgamefn">

    <a href="/" target="_blank">首页</a>

    <span class="pipe">|</span>
    
	<a href="http://127.0.0.1" target="_blank">游戏官网<</a>
    <span class="pipe">|</span>
    
    <a href="http://www.litongpay.com/buy/?wid=26752" target="_blank">充值</a>

    

    <span class="pipe">|</span>

    <a href="/UserCenter/" target="_blank">用户中心</a>

    <span class="pipe">|</span>

    <a href="/UserCenter/" target="_blank">客服中心</a>
    <span class="pipe">|</span>
        <a href="" target="_blank">玩家账号：<?php echo $_SESSION['accountName'];?></a>
    <span class="pipe">|</span>
        
    <em>充值咨询QQ：1094377156 玩家QQ群:64259261 </em>
	</div>

	<div style="float:right; text-align: left;" class="mrdia">[<a href="javascript:;" onclick="AddFavorite('http://127.0.0.1/?f=fav', '415wan网页游戏')"><strong>收藏本站</strong></a>]<font>|</font><span onClick="closenav()">[关闭JH60导航]</span></div>

</div>



</td>

</tr>

<tr>
</table>
	<!-- flash主体 -->
	
		<div id="flash_content"></div>
	</div>
	<!-- flash主体 -->

	<!-- 下载flash -->
	<div id="download_flash" style="display: none">
		<center>
			<a href="" id="flash_down_url"> <img src="static/warning.jpg"
				alt="为了您更好体验游戏，请点击下载更新包，安装完成后重新登录" /><br />
				为了您更好体验游戏，请点击下载更新包，安装完成后重新登录
			</a>
		</center>
	</div>
	<!-- 下载flash -->

</body>
<script language="javascript">
var top_bar=true;
$(function(){
	if(!flash_ver())//flash检测
		return;
	if(top_bar)//检测topbar
		$('#top_bar').hide();
	flash_resize();//调整窗口大小
	var flash_vars={
			gp:'<?=$flash_vars1?>',
			ver:<?=$ver?>
			};
	var params={
			allowScriptAccess: "always"
			}
	var attributes = {
			id:"gameSwf",
			menu:"false",
			wmode:"window"};
	swfobject.embedSWF("<?=$yxziyuan?>LoadGame.swf?<?=$ver?>", "flash_content", "100%", "94%", "10.0.0", false, flash_vars, params, attributes);
	RightClick.init();
	
	$(window).resize(function(){
		flash_resize();
	});
});


window.onresize = function(){
	flash_resize();
}
/**
 * 调整窗口大小
 */
function flash_resize(){
	
	var windows_height=$(window).height();
	var flashHeight = $("#gameSwf").height();
	
	if(!top_bar)
		windows_height-=$('#top_bar').height();
	$("#gameSwf").css({"height":windows_height});
	$('#game_frame_container').height(windows_height);
}

/**
 * 检测flash版本
 */
function flash_ver(){
	var flash_ver=parseFloat(check_flash_ver());//获取flash版本
	if(isNaN(parseFloat(flash_ver)) || parseFloat(flash_ver)<10){//检测flash版本
		$('#game_frame_container').hide();
		$('#download_flash').show();
		$('#flash_down_url').attr('href',flash_down_url());
		return false;
	}
	return true;
}

function AddFavorite(){
	try{
		window.external.addFavorite('<?=$weburl?>', document.title); 
    }catch(e){
    	try{
            window.sidebar.addPanel(document.title, '<?=$weburl?>', '');
        }catch(e){
            alert('加入收藏失败，请使用Ctrl+D进行添加,或手动在浏览器里进行设置.');
        } 
    }
}
</script>
</html>