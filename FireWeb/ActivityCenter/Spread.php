

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head><meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<?php 
  include_once "../configuration/config.inc.php";
  if(!$_SESSION['accountName']) exit("<script>location.href='../UserCenter/Login.php';</script>");
?> 
<title>
	
        <?php echo $WebTitle; ?>-推广中心
</title>
<link href="../ClientRes/Styles/BasicStyle.css?_v=634979371913162195" type="text/css" rel="stylesheet" />
<link href="../ClientRes/Styles/jquery-ui.min.css?_v=634979244165085356" type="text/css" rel="stylesheet" />
<link href="../ClientRes/Styles/jmodal.css?_v=634979244164935253" type="text/css" rel="stylesheet" />
<link href="../ClientRes/Styles/loading.css?_v=634979244165185438" type="text/css" rel="stylesheet" />
<script src="../ClientRes/Scripts/jquery-1.8.0.min.js" type="text/javascript" charset="UTF-8"></script>
 <!--如果google CDN不正常，就从本地获取JQ库。--> 
<script>!window.jQuery && document.write('<script src="/ClientRes/Scripts/jquery.min.js"><\/script>');</script>
<script src="../ClientRes/Scripts/jquery-ui.min.js?_v=634979244162663753" type="text/javascript" charset="UTF-8"></script>
<script src="../ClientRes/Scripts/jmodal.js?_v=634979244161903250" type="text/javascript" charset="UTF-8"></script>
<script src="../ClientRes/Scripts/loading.js?_v=634979244164224791" type="text/javascript" charset="UTF-8"></script>
<script src="../ClientRes/Scripts/Common.js?_v=634979706622125062" type="text/javascript" charset="UTF-8"></script>
<script src="../ClientRes/Scripts/Extends.js?_v=634979244161412905" type="text/javascript" charset="UTF-8"></script>
<script src="../ClientRes/Scripts/AjaxRequest.js?_v=634979244161282816" type="text/javascript" charset="UTF-8"></script></head>
<?php 
require '../TempLate/PublicTop.html';//引用模板 
?> 
    <div class="center clearfix mt10">
        <div class="c_main">
<?php 
require '../TempLate/LeftNav.html';//引用模板 

  	$sql="select * from user where login_account='".$_SESSION['accountName']."'";
	$result=mysql_query($sql);
	$row=mysql_fetch_array($result);
	$sql="select * from spread where tid='".$row['id']."'";
	$result=mysql_query($sql);
	$row1=mysql_fetch_array($result);
	$total=mysql_num_rows($result);
	$sql="select * from spread where tid='".$row['id']."' and islq=1";
	$result=mysql_query($sql);
	$total1=mysql_num_rows($result);
	$total1x=$total1*$tgyuanbao;
	$tg= $weburl."UserCenter/Register.php?Sid=".$row['id']."";
?> 
<div class="center_right ml10">
    <div class="mybox">
        <div class="mytit">
            我要推广
        </div>
        <div class="con clearfix">
            <p>
                账号：<b class="orange"><?php echo $row['login_account'];?></b>
                <b class="segmentation"></b><a href="/UserCenter/"    class="bt_but c_1_g mr10 tips"><u></u>返回会员中心</a></br>
                

            </p>
			<br>
            <div class="spreadWord" style="width: 763px; height: 150px;">
			
  <textarea name="AD" rows="6" cols="148" style="font-weight: bold; background-color: #FFFAE5; color: #FF5A00; border: 1px #CCB59F solid; width: 778px; height: 100px; font-size: 12px;">
∷→丨【双线】【<?php echo $WebTitle; ?>】【上线直接就送100万绑定银两、1000万铜钱+GM武器 属性给力】
∷→丨
∷→丨江湖问剑一区 正式开启                           　　　　　　　
∷→丨
∷→丨是一款武侠题材的即时战斗网页游戏，游戏采集众多武侠小说中的情节与人物构成了游戏世界中的江湖。
∷→丨游戏画面精美，系统内容丰富，拥有令人心动的红颜馆，可招募各大江湖美女；可招募武林豪杰为门客，共闯天下；
∷→丨还有趣味的侠客历练与精彩刺激的副本玩法等着玩家。　　　　　　　　　
∷→丨
∷→丨神兵系统 超炫 翅膀系统 超靓 坐骑系统 超给力  各种FB 活动 PK战 皇城战 激情给力
∷→丨　
∷→丨绚丽的职业技能，强大的战斗、副本系统，各种奇珍异宠，多彩玩法变幻莫测。　　　　　　
∷→丨
∷→丨就让我们在美轮美奂的剑侠世界演绎自己的神话　　　　　　　　　　　　　　　　　　　
∷→丨
∷→丨2014年7月 江湖问剑正式开始起航 打造全新的豪华阵容 一起感受激情　　　　　　　
∷→丨
∷→丨做第一个任务送1亿铜币+GM武器一把　　　　　　　　　　　　　　　　　　　　　　　　　　　　　
∷→丨　
∷→丨玩家QQ群；
∷→丨
∷→丨注册地址：<?php echo $tg;?>   
</textarea><br>
<center><input  style="width:480px;height:22px;color:#F30000;font-size:12px;"  type="button" value="点击复制推广内容——非IE浏览器请手动复制以上内容" name="COPY" onClick=window.clipboardData.setData('Text',document.all.AD.value); /></center>		
<br>
			
                
            </div>
        </div>
    </div>
</div>
<?php 
require '../TempLate/PublicButtom.html';//引用模板 
?> 
</html>
