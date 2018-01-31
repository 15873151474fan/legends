<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head><meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<style type="text/css">
/* green */
.button {
	display: inline-block;
	zoom: 1; /* zoom and *display = ie7 hack for display:inline-block */
	*display: inline;
	vertical-align: baseline;
	margin: 0 2px;
	outline: none;
	cursor: pointer;
	text-align: center;
	text-decoration: none;
	font: 12px/100% Arial, Helvetica, sans-serif;
	padding: .2em 2em .22em;
	text-shadow: 0 1px 1px rgba(0,0,0,.3);
	-webkit-border-radius: .3em; 
	-moz-border-radius: .3em;
	border-radius: .3em;
	-webkit-box-shadow: 0 1px 2px rgba(0,0,0,.2);
	-moz-box-shadow: 0 1px 2px rgba(0,0,0,.2);
	box-shadow: 0 1px 2px rgba(0,0,0,.2);
}
.button:hover {
	text-decoration: none;
}
.button:active {
	position: relative;
	top: 1px;
}
/* white */
.white {
	color: #606060;
	border: solid 1px #b7b7b7;
	background: #fff;
	background: -webkit-gradient(linear, left top, left bottom, from(#fff), to(#ededed));
	background: -moz-linear-gradient(top,  #fff,  #ededed);
	filter:  progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffffff', endColorstr='#ededed');
}
.white:hover {
	background: #ededed;
	background: -webkit-gradient(linear, left top, left bottom, from(#fff), to(#dcdcdc));
	background: -moz-linear-gradient(top,  #fff,  #dcdcdc);
	filter:  progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffffff', endColorstr='#dcdcdc');
}
.white:active {
	color: #999;
	background: -webkit-gradient(linear, left top, left bottom, from(#ededed), to(#fff));
	background: -moz-linear-gradient(top,  #ededed,  #fff);
	filter:  progid:DXImageTransform.Microsoft.gradient(startColorstr='#ededed', endColorstr='#ffffff');
}

</style>
<?php 
  include_once "../configuration/config.inc.php";
   if(!$_SESSION['accountName']) exit("<script>location.href='Login.php';</script>");
?>
<title>	
        <?php echo $WebTitle; ?>-会员中心
</title>
<link href="/ClientRes/Styles/BasicStyle.css?_v=634979371913162195" type="text/css" rel="stylesheet" />
<link href="/ClientRes/Styles/jquery-ui.min.css?_v=634979244165085356" type="text/css" rel="stylesheet" />
<link href="/ClientRes/Styles/jmodal.css?_v=634979244164935253" type="text/css" rel="stylesheet" />
<link href="/ClientRes/Styles/loading.css?_v=634979244165185438" type="text/css" rel="stylesheet" />
<script src="/ClientRes/Scripts/jquery-1.8.0.min.js" type="text/javascript" charset="UTF-8"></script>
<script src="/ClientRes/Scripts/jquery-ui.min.js?_v=634979244162663753" type="text/javascript" charset="UTF-8"></script>
<script src="/ClientRes/Scripts/jmodal.js?_v=634979244161903250" type="text/javascript" charset="UTF-8"></script>
<script src="/ClientRes/Scripts/loading.js?_v=634979244164224791" type="text/javascript" charset="UTF-8"></script>
<script src="/ClientRes/Scripts/Common.js?_v=634979706622125062" type="text/javascript" charset="UTF-8"></script>
<script src="/ClientRes/Scripts/Extends.js?_v=634979244161412905" type="text/javascript" charset="UTF-8"></script>
<script src="/ClientRes/Scripts/AjaxRequest.js?_v=634979244161282816" type="text/javascript" charset="UTF-8"></script></head>

<?php 
require '../TempLate/PublicTop.html';//引用模板 
?> 
    <div class="center clearfix mt10">
        <div class="c_main">
<?php 
require '../TempLate/LeftNav.html';//引用模板
?> 
<?php 
//$username=$_SESSION['accountName']; 
$sql="select * from $database.user where login_account='".$_SESSION['accountName']."'"; 
$result=mysql_query($sql);
$row3=mysql_fetch_array($result); 
$psw=$row3['password'];
$_SESSION['id']=$row3['id']; 
$login_name = $_SESSION['accountName'].'_'.$spid;
$sql="select * from $database3.globaluser where account='".$login_name."'"; 
$result=mysql_query($sql); 
$row=mysql_fetch_array($result); 
$userid=$row['userid'];
$sql="select * from $database.spread where tid='".$_SESSION['accountName']."'"; 
$result=mysql_query($sql); 
$row1=mysql_fetch_array($result); 
$total=mysql_num_rows($result); 
//$dhyb=$row3['idnumber']*$tgyuanbao; 
//$timestamp = time(); 
//$cm = 1; 
//$str = $username.$timestamp.$GLOBALS['platform']['loginKey'].$cm; 
//$flag=md5($str); $_SESSION['flag'] = 1; 
?> 
<?php 
//$name=$_SESSION['accountName'];
//$time=time();
	//$key='jwjeDljl-sdlj213988WED^W9kjasdjlkoie2130942323';
	//$InterfaceKey = '@891wan@login@key8@';
	//$md5=md5($name.urlencode($name).$time.$key);
	//$username=rawurlencode(base64_encode($_SESSION['accountName']));
	$password=rawurlencode(base64_encode($psw));
	//$payurl=rawurlencode(base64_encode($yxchongzhi));
	//$RepUS=rawurlencode(base64_encode($repus));
	//$flag_ = md5($_SESSION['accountName'].$time.$InterfaceKey.$row3['password
	$pTime = time();
	$flag_plant="account=".$$_SESSION['accountName']."&ServId=".$ServerId."&Spid=".$spid."&Key=".$InterfaceKey."&Time=".$pTime;
	$flag_forward=md5($$flag_plant);
	?>
<div class="center_right ml10">
    <!--无邮箱提示开始 检测到无邮箱才显示-->
    
    <!--无邮箱提示结束-->


    <div class="basicInfo">
        <div class="basicInfo_content">
            <p>
                账号：<b class="orange"><?php echo $row3['login_account'];?></b>
&nbsp;&nbsp;&nbsp;&nbsp;为了您账户安全，建议您经常&nbsp;<b class="orange"><a href="ChangePass.php">修改密码</a></b>&nbsp;确保账户安全！
            </p>
             <p>
				
				登陆时间：<b class="orange"><?php echo $row3['login_time'];?></b>
            </p>
            <p>
                推广信息：当前<b class="orange"><?php  echo $total;?></b>个达到<b class="orange"><?php echo $lv;?></b>级的推广<b class="segmentation"></b>每个推广<b class="orange"><?php echo $tgyuanbao;?>元宝</b><b class="segmentation"></b>可兑换<b class="orange"><?php echo $dhyb;?></b>个元宝
                
            </p>
			<!--p> <b class="orange">================= 服务器列表 =================</b> </p-->
            <p>
            <!--<a href="<?="../webgame/game_s1_T.php?LoginUser=".$name2."&LoginVerify=".$password."&ServerId=".$server_id."&SPID=".$spid."&PayURL=".$payurl."&RepUS=".$RepUS.""?>"  class="bt_but c_1_g mr10 tips" target=_blank><u></u><span style="color:#006600;">进入游戏(今日刚开)</span></a>-->
           <!--  <a href="<?="../webgame/game_s1_T.php?account=".$name2."&password=".$password."&ServId=".$server_id."&Spid=".$spid."&sign=".$flag_.""?>"  class="bt_but c_1_g mr10 tips" target=_blank><u></u><span style="color:#006600;">进入游戏(今日刚开)</span></a>-->
<a href="<?="../webgame/login.php?account=".$_SESSION['accountName']."&password=".$password."&ServId=".$ServerId."&Spid=".$spid."&sign=".$flag_forward."&time=".$pTime."&fcm=1&client=0"?>"  class="bt_but c_1_g mr10 tips" target=_blank><u></u><span style="color:#006600;">进入游戏(今日刚开)</span></a>

				<!--a href="/Gamelogin2.php"  class="bt_but c_1_g mr10 tips" target=_blank><u></u>网通入口1进入游戏</a-->
<a  onclick="SpreadTran();"   class="bt_but c_1_g mr10 tips"><u></u><span style="color:#E53333;">兑换推广元宝</span></a>
				<a  onclick="SignOut();"   class="bt_but c_1_g mr10 tips"><u></u>注销登录</a></a>
			</p>
        </div>

        <div class="basicInfo_currency">
            <ul class="clearfix">
			<li><span class="orange">累计充值金额：</span> <span><?php echo $row3['xyuanbao'];?></span></li>
                <li><span class="orange">还未领取的充值元宝：</span> <span><?php echo $row3['dj'];?></span></li>
<li><form action="/coon/de.php" methmod="post"><input class="button white" type="text" tabindex="1" name="nums" id="nums" size="7" value="输入金额"onfocus="if (value =='输入金额'){value =''}"onblur="if (value ==''){value='输入金额'}" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"/>&nbsp;&nbsp;<input type="submit" value="充值入账"></form></li>
<li><div align=center>充值入账后，游戏中商城提取</div></li>
            </ul>
        </div>
    </div>
    <div class="basicInfor-content-shadow">
    </div>
	<br />
	
<?php
$CAREERS = array(
    1 => "战士",
    2 => "法师",
    3 => "道士",
);
$ON = array(
    1 => "在线",
    0 => "离线",
);
$COUNTRY = array(
    1 => "吴国",
    3 => "魏国",
    2 => "蜀国",
);
$CAMP = array(
    1 => "士兵",
    2 => "军士",
    3 => "校卫",
	3 => "总兵",
);
$x=1;
$sql2="select * from $database2.actors where accountid='".$userid."' and not status=0"; 
$result2=mysql_query($sql2); 

while($row2=mysql_fetch_array($result2)and $x<=10){

 ?>
    <div class="mybox">
	
        <script type="text/javascript">
            $(function () {
                $.ajaxSetup({ cache: false });
                $("#tabs<?=$x?>").tabs();
            })
        </script>
		<p>
 <div class="mytit">
   角色信息[<b class="orange">请先创建角色，角色数据以游戏内为准</b>]         
        </div>
		
        <div class="myinfo_con clearfix">
          <script type="text/javascript">
                $(function () {
                    <?php 
						if(!$row2 || !is_array($row2)){
							echo '$'.'("#tabs$x").html("<strong>您还没有创建角色，创建角色后可在此处领取推广元宝</strong>")';
						}
					?>
                })
            </script>
<div id="tabs<?=$x?>" class="ui_tabs<?=$x?>">
                <ul>
                    <li><a href="#tabs-<?=$x?>"><?php echo $row2['actorname'];?></a></li>
                </ul>
            <div id="tabs-<?=$x++?>">	
			<p>
            VIP：<b class="orange"><?php echo $row2['viplevel'];?></b>&nbsp;|&nbsp; 
			<!--国家：<b class="orange"><?php echo $COUNTRY[$row4['country']];?></b>&nbsp;|&nbsp;-->
			性别：<b class="orange"><?php $SEX=$row2['sex'] == 1 ? '女':'男';echo $SEX?></b>&nbsp;|&nbsp;
			等级：<b class="orange">LV<?php echo $row2['LEVEL'];?></b>&nbsp;|&nbsp;
			PK值：<b class="orange"><?php echo $row2['pkvalue'];?></b>&nbsp;|&nbsp;
			<!--军团：<b class="orange"><?php echo $row2['guild_name'];?><?php echo $row2['evil'];?></b>&nbsp;|&nbsp;-->
			职业:<b class="orange"><?php echo $CAREERS[$row2['job']];?></b>&nbsp;|&nbsp;
			经验：<b class="orange"><?php echo $row2['EXP'];?></b>&nbsp;&nbsp;|&nbsp;
			HP：<b class="orange"><?php echo $row2['hp'];?></b>&nbsp;&nbsp;|&nbsp;
			MP：<b class="orange"><?php echo $row2['mp'];?></b>&nbsp;&nbsp;|&nbsp;
			战力：<b class="orange"><?php echo $row2['battlepower'];?></b>&nbsp;&nbsp;|&nbsp;
			
			元宝：<b class="orange"><?php echo $row2['nonbindyuanbao'];?></b>&nbsp;&nbsp;	
			绑元：<b class="orange"><?php echo $row2['bindyuanbao'];?></b>&nbsp;&nbsp;
			铜钱：<b class="orange"><?php echo $row2['nonbindcoin'];?></b>&nbsp;&nbsp;&nbsp;&nbsp;
			绑铜：<b class="orange"><?php echo $row2['bindcoin'];?><?php echo $u4;?></b>&nbsp;&nbsp;
            
		
	</p>
	
	</div>
		 </div>
		 
</div></div>

<div class="basicInfor-content-shadow">
    </div>
	<?php  }?>
	
   </p>

<div class="basicInfor-content-shadow">
    </div>


</div>
</div></div>
<?php 
require '../TempLate/PublicButtom.html';//引用模板 
?> 
</html>
