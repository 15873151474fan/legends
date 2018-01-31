

<!DOCTYPE html>
<?php 
  include_once "../Configuration/config.inc.php";
  if(!$_SESSION['accountName']) exit("<script>location.href='Login.php';</script>");
?> 
<html xmlns="http://www.w3.org/1999/xhtml">
<head><meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /><title>	
        <?php echo $WebTitle; ?>-修改密码
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
<?php 
require '../TempLate/LeftNav.html';//引用模板 
?> 
<link href="/ClientRes/Styles/IptStyle.css" type="text/css" rel="stylesheet" />
<div class="center_right ml10">
    <div class="mybox">
        <div class="mytit">
            修改密码</div>
        <div class="con clearfix">
            <div class="ipt_box">
                <div class="ipt_form">
                    <dl>
                        <dd class="clearfix" style="position: static; z-index: 999;">
                            <em class="lab">当前密码:</em> <span class="at_text t_1_o">
                                <input type="password" maxlength="24" size="24" id="o_pas" value="" name="opass" />
                                <em></em></span>
                        </dd>
                        <dd class="clearfix">
                            <em class="lab">设置新密码:</em> <span class="at_text t_1_d">
                                <input type="password" maxlength="24" size="24" id="u_pas" value="" name="npass" />
                                <em></em></span>
                        </dd>
                        <dd class="clearfix">
                            <em class="lab">确认新密码:</em> <span class="at_text t_1_d">
                                <input type="password" maxlength="24" size="24" id="u_pas1" value="" name="rpass" />
                                <em></em></span>
                        </dd>
                        <dd class="clearfix">
                            <em class="lab"></em><a id="reg_sub" class="at_but b_1_y" onclick="ChangePass();"><u>
                            </u>确认</a>
                        </dd>
                    </dl>
                </div>
            </div>
        </div>
    </div>
</div>
<?php 
require '../TempLate/PublicButtom.html';//引用模板 
?> 
</html>
