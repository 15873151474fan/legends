<?php

/******此文件必须保存为UTF8编码******/

//SPID定义
define('SPID','91w');
//SP定义的游戏名称
define('GAMENAME', '《刀剑如梦》');
//重登录URL地址（收藏夹地址）
define('LOGINURL','http://www.91wan.com/djrm/list/');
//官网
define('HOMEURL','http://www.91wan.com/djrm/');
//论坛
define('BBSURL','http://bbs.91wan.com/forum-425-1.html');
//服务器ID基值
define('SERVERIDBASE', 0);
//语言
define('LANGUAGE', 'zh-CN');
//游戏程序文件
define('GAMEAPPURL','LoadGame.swf');
//登录认证密码
define('LOGINVERIFY', '4a2b4be714bb71f6d909885b14f411a3');
//接口密钥定义
$InterfaceKey = '@891wan@login@key8@';
//游戏侧边信息包含页URL地址定义
//define('FrameSiderUrl', 'http://www.91wan.com/gLftBarCommon/zjcq/index.html');
//游戏侧边信息包含页宽度定义
//define('FrameSiderWidth', 131);

function gameTopLinks()
{
	$sn = $_SESSION['GameServerName'];
	$link = 
		 '<a href="'.HOMEURL.'" target="_blank">官网</a>&nbsp;'
//		.'<a href="'.$_SESSION['PayURL'].'" target="_blank"><font color="#00FF00">充值</font></a>&nbsp;'
		.'<a href="http://www.91wan.com/djrm/xsk/" target="_blank"><font color="#00FF00">新手卡</font></a>&nbsp;'
		.'<a href="'.BBSURL.'" target="_blank">论坛</a>&nbsp;'
		.'<a href="javascript:addBookmark(\''.GAMENAME.' - '.$sn.'\', \''.GetFavUrl().'\')"><font color="#FF66FF">收藏</font></a>&nbsp;'
		.'<a href="http://www41.r.53kf.com/webCompany.php?arg=91wan&style=10" target="_blank">在线客服</a>&nbsp;'
//		.'<a href="http://www.91wan.com/djrm/huodong/wish/" target="_blank">祝福送礼</a>'
		;
	return $link;
}

function GetLoginUrl()
{
  return LOGINURL;
}

function GetFavUrl()
{
	return 'http://'.$_SERVER['HTTP_HOST'].$_SERVER['PHP_SELF'];
}





