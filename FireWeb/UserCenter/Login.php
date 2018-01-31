

<!DOCTYPE html>
<?php 
  include_once "../configuration/config.inc.php";
?> 

<html xmlns="http://www.w3.org/1999/xhtml">
<head><meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /><title>	
        <?php echo $WebTitle; ?>-用户中心
</title>
<link href="/ClientRes/Styles/BasicStyle.css?_v=634979371913162195" type="text/css" rel="stylesheet" />
<link href="/ClientRes/Styles/Login.css?_v=634979244165265481" type="text/css" rel="stylesheet" />
<link href="/ClientRes/Styles/jmodal.css?_v=634979244164935253" type="text/css" rel="stylesheet" />
<link href="/ClientRes/Styles/loading.css?_v=634979244165185438" type="text/css" rel="stylesheet" />
<script src="/ClientRes/Scripts/jquery-1.8.0.min.js" type="text/javascript" charset="UTF-8"></script>
 <!--如果google CDN不正常，就从本地获取JQ库。--> 
<script>!window.jQuery && document.write('<script src="/ClientRes/Scripts/jquery.min.js"><\/script>');</script>
<script src="/ClientRes/Scripts/Ipt.js?_v=634979244161733134" type="text/javascript" charset="UTF-8"></script>
<script src="/ClientRes/Scripts/jmodal.js?_v=634979244161903250" type="text/javascript" charset="UTF-8"></script>
<script src="/ClientRes/Scripts/loading.js?_v=634979244164224791" type="text/javascript" charset="UTF-8"></script>
<script src="/ClientRes/Scripts/Common.js?_v=634979706622125062" type="text/javascript" charset="UTF-8"></script>
<script src="/ClientRes/Scripts/AjaxRequest.js?_v=634979244161282816" type="text/javascript" charset="UTF-8"></script></head>
<?php 
require '../TempLate/PublicTop.html';//引用模板 
?> 
    <div class="center clearfix mt10">
        <div class="c_main">

<div class="reg_box">
    <div class="tit gray3">
        <b class="gray1 mr15">快速登录</b>
    </div>
    <div class="reg_form">
	
<!--<p align=center><font color=#2b2bd5 size=5>4区玩家帐号与1区账号重复的（或者现在不能登录的)在账号后面加字母4q</font></p>
<p align=center><font color=#2b2bd5 size=5>3区玩家帐号与1区账号重复的（或者现在不能登录的)在账号后面加字母3q</font></p>
<p align=center><font color=#2b2bd5 size=5>2区玩家帐号与1区账号重复的（或者现在不能登录的)在账号后面加字母2q</font></p>-->

        <div id="reg_box">
            <dl>
                <dd class="clearfix">
                    <em class="lab">用&nbsp;户&nbsp;名:</em> <span class="at_text t_1_e">
                        <input type="text" tabindex="1" name="acc" id="u_name" value="" />
                        <em class="on"><u class="at_msg m_3_o"></u></em></span>
                    <div class="clear">
                    </div>
                </dd>
                <dd class="clearfix">
                    <em class="lab">游戏密码:</em> <span class="at_text t_1_d">
                        <input type="password" tabindex="2" name="pas" id="u_pas" />
                        <em></em></span>
                </dd>
                <dd class="clearfix">
                    <em class="lab"></em><a id="reg_sub" class="at_but b_1_y" onclick="Login();"><u></u>
                        登录</a> 
                </dd>
            </dl>
        </div>
        <div class="have_count">
            <h3 class="mb10">还没有帐号？</h3>
            <p>
                <a class="at_but b_1_g" href="/UserCenter/Register.php"><u></u>立即注册 </a>
            </p>
        </div>
        <div class="clear">
        </div>
    </div>
</div>
<?php 
require '../TempLate/PublicButtom.html';//引用模板 
?> 
</html>
