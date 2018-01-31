<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<style type="text/css">
*{margin:0px; padding:0px; overflow:hidden;}
html, body, #swfContainer, #swfContent{height:100%;}
body{background:#000;}
body, div{font-family: 宋体;	font-size: 12px; color: #FFFFFF;}
#navBar{text-align:right; padding:2px;}
</style>
<script type="text/javascript" src="js/rightClick.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript" src="js/swfobject.js"></script>
<script type="text/javascript">

function loaded(){
	//alert("onloaded");
	resize();
	var flashvars = getParams();
	flashvars["ver"] = <?=filemtime('LoadGame.swf')?>;
	var params = {
		allowScriptAccess: "always",
		menu:"false",
		wmode:"direct"}; //需设置该属性为'always'};
	var attributes = {
		id:"gameSwf",
		menu:"false",
		wmode:"window"};
	swfobject.embedSWF("LoadGame.swf", "swfContent", "100%", "100%", "10.0.0", false, flashvars, params, attributes);
}
function resize(){
	var clientH = document.body.clientHeight;
	var navH = 0;
	var flashvars = getParams();
	//如果是端登陆，则把 中间嵌入的删除
	//if(flashvars["client"] =="1"  )
	if(true )
	{
		var nav = document.getElementById("navBar");
		if ( nav != null)
		{
			nav.parentNode.removeChild( nav);
		}

	}
	else
	{
		navH= $("navBar").offsetHeight;
	}
	
	$('swfContainer').style.height = (clientH - navH) + "px";
	//alert("clientHeight:" + clientH + ", navHeight:" + navH + ", swfHeight:" + $('swfContainer').style.height);
}

function addBookmark_game()
{
	addBookmark("《刀剑如梦》", "http://www.521g.com/miros/wwy/jxjh/game.html");
}
</script>
</head>
<body id="GameFrameContainer" onload="loaded();RightClick.init();" onresize="resize();">
<div id="navBar">充值 官网 论坛 收藏</div>
<div id="swfContainer"><div id="swfContent"></div></div>
</body>
</html>