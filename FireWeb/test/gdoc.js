// JavaScript Document
/*
	此脚本用于生成显示游戏swf的页面并向swf传递游戏参数
	调用此脚本的页面必须被传递有如下类型的参数：
	srvaddr=登陆服务器地址&srvport=登陆端口&srvid=服务器ID&&spid=运营商标识&ressite=游戏资源服务器站点地址
*/
function get(p){
var url= document.URL.toString();
var tmpStr=p+"=";
var tmp_reg=eval("/[\?&]"+tmpStr+"/i");
if(url.search(tmp_reg)==-1)return null;
else{
    var a=url.split(/[\?&]/);
    for(var i=0;i<a.length;i++)
         if(a[i].search(eval("/^"+tmpStr+"/i"))!=-1)return a[i].substring(tmpStr.length);
}
}


srvaddr = get("srvaddr");

srvport = get("srvport");

srvid = get("srvid");

spid = get("spid");

ressite = get("ressite");

rankurl = get("rankurl");

user = get("user");

lang = get("lang");

gameName = get("gameName");

if ( !lang || lang == '' ) lang = "zh-CN";
if ( !gameName || gameName == '' ) gameName = '《剑啸江湖》';


		
		
		//"网页可见区域宽："+ document.body.clientWidth; 
        //网页可见区域高："+ document.body.clientHeight; 
        //网页可见区域高："+ document.body.offsetWidth +" (包括边线的宽)"; 
        //网页可见区域高："+ document.body.offsetHeight +" (包括边线的宽)"; 
		//网页正文全文宽："+ document.body.scrollWidth; 
		//网页正文全文高："+ document.body.scrollHeight; 
		//网页被卷去的高："+ document.body.scrollTop; 
		//网页被卷去的左："+ document.body.scrollLeft; 
		//网页正文部分上："+ window.screenTop; 
		//网页正文部分左："+ window.screenLeft; 
		//屏幕分辨率的高："+ window.screen.height; 
		//屏幕分辨率的宽："+ window.screen.width; 
		//屏幕可用工作区高度："+ window.screen.availHeight; 
		//屏幕可用工作区宽度："+ window.screen.availWidth; 
var width= document.body.clientWidth;
var height = document.body.clientHeight;
//alert('原始大小：'+width + 'x' + height);
//if (width > 1000) width = 1000; else if (width < 1000) width = 1000;//宽度不能小于1000，否则按钮看不到
//if (height > 600) height = 600; else if (height < 500) height = 500;
if (width < 1000) width = 1000;//宽度不能小于1000，否则按钮看不到
if (height < 500) height = 500;
//alert('修正后大小：'+width + 'x' + height);

var _flvars = 'srvaddr='+srvaddr+'&srvport='+srvport+'&srvid='+srvid+'&&spid='+spid+'&ressite='+ressite+'&rankurl='+rankurl+'&width='+width+'&height='+height+'&lang='+lang+'&gameName='+gameName;

document.write(
	'<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"'
	+ '	id="gameProject"'
	+ '	codebase="http://fpdownload.macromedia.com/get/flashplayer/current/swflash.cab" width="' + width + '" height="' + height + '" align="middle">'
	+ '	<param name="movie" value="LoadGame.swf" />'
	+ '	<param name="quality" value="high" />'
	+ '	<param name="flashVars" value="' + _flvars + '" />'
	+ '	<param name="bgcolor" value="0" />'
	+ '	<param name="allowScriptAccess" value="sameDomain" />'
	+ '	<param name="menu" value="false" />'
	+ '	<embed src="LoadGame.swf" quality="high" bgcolor="0"'
	+ '		width="' + width + '" height="' + height + '" name="MingJiangClient" align="middle"'
	+ '		play="true"'
	+ '		loop="false"'
	+ '		quality="high"'
	+ '		menu="false"'
	+ '		allowScriptAccess="sameDomain"'
	+ '		type="application/x-shockwave-flash"'
	+ '		flashVars="' + _flvars + '"'
	+ '		pluginspage="http://www.adobe.com/go/getflashplayer">'
	+ '	</embed>'
	+ '</object>'
	);
