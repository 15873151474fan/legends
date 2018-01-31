/// <reference path="Common.js" />
/// <reference path="Ipt.js" />
var PayUrl = "/GameCenter/Pay.htm";
function Register() {
    if (blurNameStyle() && blurPassStyle() && blurPass1Style()&&blurSCodeStyle()) {
        var uName = $.trim($("#u_name").val());
        var uPas = $.trim($("#u_pas").val());
        var uPas1 = $.trim($("#u_pas1").val());
		var sCode = $.trim($("#s_code").val());
        DoAjax("/AjaxRequest/AccountHandler.php", { Action: "Register", uName: uName, uPas: uPas,  sCode: sCode,Sid: GetParasValue("Sid") }, function (msg) {
            HideLoading(); //不管是否成功，都要Hide
            if (msg.indexOf("成功") > 0)
                ShowModalAndRedirect(FormatMsg(msg, "green"), "/UserCenter/");
            else
                ShowModal(FormatMsg(msg, "red"));
        });
    }
}

function Login() {
    if (blurNameStyle() && blurPassStyle()) {
        var uName = $.trim($("#u_name").val());
        var uPas = $.trim($("#u_pas").val());
        DoAjax("/AjaxRequest/AccountHandler.php", { Action: "Login", uName: uName, uPas: uPas }, function (msg) {
            HideLoading();
            if (msg.indexOf("成功") > 0) {
                ShowModalAndRedirect(FormatMsg(msg, "green"), "/UserCenter/");
            } else {
                ShowModal(FormatMsg(msg, "red"));
            }
        });
    }
}

function SignOut() {
    DoAjax("/AjaxRequest/AccountHandler.php", { Action: "SignOut" }, function (msg) {
        HideLoading();
		if (msg.indexOf("成功") > 0) {
                ShowModalAndRedirect(FormatMsg(msg, "green"), "/UserCenter/Login.php");
        } else {
            ShowModal(FormatMsg("网络繁忙，请稍后再试。", "red"));
        }
    });
}

function ChangePass() {
    if (blurOPassStyle && blurPassStyle() && blurPass1Style()) {
        var oPas = $.trim($("#o_pas").val());
        var uPas = $.trim($("#u_pas").val());
        DoAjax("/AjaxRequest/AccountHandler.php", { Action: "ChangePass", oPas: oPas, uPas: uPas }, function (msg) {
            HideLoading();
            if (msg.indexOf("成功") > 0) {
                ShowModalAndRedirect(FormatMsg(msg, "green"), "/UserCenter/Login.php");
            } else {
                ShowModal(FormatMsg(msg, "red"));
            }
        });
    }
}

function SecurityEmail() {
    if (blurUMailStyle() && blurRMailStyle()) {
        var uMail = $.trim($("#u_mail").val());
        var rMail = $.trim($("#r_mail").val());
        DoAjax("/AjaxRequest/AccountHandler.php", { Action: "SecurityEmail", uMail: uMail }, function (msg) {
            HideLoading();
            if (msg.indexOf("成功") > 0) {
                ShowModal(FormatMsg(msg, "green"));
            } else {
                ShowModal(FormatMsg(msg, "red"));
            }
        });
    }
}

function BackPass() {
    if (blurNameStyle() && blurPassStyle() && blurPass1Style() && blurSCodeStyle()) {
        var uName = $.trim($("#u_name").val());
        var uPas = $.trim($("#u_pas").val());
        var sCode = $.trim($("#s_code").val());
        DoAjax("/AjaxRequest/AccountHandler.php", { Action: "BackPass", uName: uName, uPas: uPas, sCode: sCode }, function (msg) {
            HideLoading();
            if (msg.indexOf("成功") > 0) {
                ShowModalAndRedirect(FormatMsg(msg, "green"), "/UserCenter/Login.aspx");
            } else {
                ShowModal(FormatMsg(msg, "red"));
            }
        });
    }
}

function SpreadTran() {
    DoAjax("/AjaxRequest/AccountHandler.php", { Action: "SpreadTran" }, function (msg) {
        HideLoading();
        if (msg.indexOf("成功") > 0) {
            ShowModal(FormatMsg(msg, "green"));
        } else {
            ShowModal(FormatMsg(msg, "red"));
        }
    });
}
function shouchong() {
    DoAjax("/AjaxRequest/AccountHandler.php", { Action: "shouchong" }, function (msg) {
        HideLoading();
        if (msg.indexOf("成功") > 0) {
            ShowModal(FormatMsg(msg, "green"));
        } else {
            ShowModal(FormatMsg(msg, "red"));
        }
    });
}
function kahaozijiu() {
    DoAjax("/AjaxRequest/AccountHandler.php", { Action: "kahaozijiu" }, function (msg) {
        HideLoading();
        if (msg.indexOf("成功") > 0) {
            ShowModal(FormatMsg(msg, "green"));
        } else {
            ShowModal(FormatMsg(msg, "red"));
        }
    });
}
function logingame() {
    DoAjax("/AjaxRequest/AccountHandler.php", { Action: "logingame" }, function (msg) {
        HideLoading();
        if (msg.indexOf("成功") > 0) {
            ShowModal(FormatMsg(msg, "green"));
        } else {
            ShowModal(FormatMsg(msg, "red"));
        }
    });
}
function zhizunshangcheng() {
    DoAjax("/AjaxRequest/AccountHandler.php", { Action: "zhizunshangcheng" }, function (msg) {
        HideLoading();
        if (msg.indexOf("成功") > 0) {
            ShowModal(FormatMsg(msg, "green"));
        } else {
            ShowModal(FormatMsg(msg, "red"));
        }
    });
}
function zhanshi() {
    DoAjax("/AjaxRequest/AccountHandler.php", { Action: "zhanshi" }, function (msg) {
        HideLoading();
        if (msg.indexOf("成功") > 0) {
            ShowModal(FormatMsg(msg, "green"));
        } else {
            ShowModal(FormatMsg(msg, "red"));
        }
    });
}
function daoshi() {
    DoAjax("/AjaxRequest/AccountHandler.php", { Action: "yiqianwulibao" }, function (msg) {
        HideLoading();
        if (msg.indexOf("成功") > 0) {
            ShowModal(FormatMsg(msg, "green"));
        } else {
            ShowModal(FormatMsg(msg, "red"));
        }
    });
}
function fashi() {
    DoAjax("/AjaxRequest/AccountHandler.php", { Action: "jiubailibao" }, function (msg) {
        HideLoading();
        if (msg.indexOf("成功") > 0) {
            ShowModal(FormatMsg(msg, "green"));
        } else {
            ShowModal(FormatMsg(msg, "red"));
        }
    });
}
function yuyi() {
    DoAjax("/AjaxRequest/AccountHandler.php", { Action: "wubailibao" }, function (msg) {
        HideLoading();
        if (msg.indexOf("成功") > 0) {
            ShowModal(FormatMsg(msg, "green"));
        } else {
            ShowModal(FormatMsg(msg, "red"));
        }
    });
}
function meili() {
    DoAjax("/AjaxRequest/AccountHandler.php", { Action: "sanbailibao" }, function (msg) {
        HideLoading();
        if (msg.indexOf("成功") > 0) {
            ShowModal(FormatMsg(msg, "green"));
        } else {
            ShowModal(FormatMsg(msg, "red"));
        }
    });
}
function daoshiyuan() {
    DoAjax("/AjaxRequest/AccountHandler.php", { Action: "daoshiyuan" }, function (msg) {
        HideLoading();
        if (msg.indexOf("成功") > 0) {
            ShowModal(FormatMsg(msg, "green"));
        } else {
            ShowModal(FormatMsg(msg, "red"));
        }
    });
}
function wushiyuan() {
    DoAjax("/AjaxRequest/AccountHandler.php", { Action: "wushiyuan" }, function (msg) {
        HideLoading();
        if (msg.indexOf("成功") > 0) {
            ShowModal(FormatMsg(msg, "green"));
        } else {
            ShowModal(FormatMsg(msg, "red"));
        }
    });
}
function yibaiyuan() {
    DoAjax("/AjaxRequest/AccountHandler.php", { Action: "yibaiyuan" }, function (msg) {
        HideLoading();
        if (msg.indexOf("成功") > 0) {
            ShowModal(FormatMsg(msg, "green"));
        } else {
            ShowModal(FormatMsg(msg, "red"));
        }
    });
}
function shiyuana() {
    DoAjax("/AjaxRequest/AccountHandler.php", { Action: "shiyuana" }, function (msg) {
        HideLoading();
        if (msg.indexOf("成功") > 0) {
            ShowModal(FormatMsg(msg, "green"));
        } else {
            ShowModal(FormatMsg(msg, "red"));
        }
    });
}
function daoshiyuana() {
    DoAjax("/AjaxRequest/AccountHandler.php", { Action: "daoshiyuana" }, function (msg) {
        HideLoading();
        if (msg.indexOf("成功") > 0) {
            ShowModal(FormatMsg(msg, "green"));
        } else {
            ShowModal(FormatMsg(msg, "red"));
        }
    });
}
function wushiyuana() {
    DoAjax("/AjaxRequest/AccountHandler.php", { Action: "wushiyuana" }, function (msg) {
        HideLoading();
        if (msg.indexOf("成功") > 0) {
            ShowModal(FormatMsg(msg, "green"));
        } else {
            ShowModal(FormatMsg(msg, "red"));
        }
    });
}
function shiyuanwocao() {
    DoAjax("/AjaxRequest/AccountHandler.php", { Action: "shiyuanwocao" }, function (msg) {
        HideLoading();
        if (msg.indexOf("成功") > 0) {
            ShowModal(FormatMsg(msg, "green"));
        } else {
            ShowModal(FormatMsg(msg, "red"));
        }
    });
}
function yibaiyuana() {
    DoAjax("/AjaxRequest/AccountHandler.php", { Action: "yibaiyuana" }, function (msg) {
        HideLoading();
        if (msg.indexOf("成功") > 0) {
            ShowModal(FormatMsg(msg, "green"));
        } else {
            ShowModal(FormatMsg(msg, "red"));
        }
    });
}
function shiyuanaa() {
    DoAjax("/AjaxRequest/AccountHandler.php", { Action: "shiyuanaa" }, function (msg) {
        HideLoading();
        if (msg.indexOf("成功") > 0) {
            ShowModal(FormatMsg(msg, "green"));
        } else {
            ShowModal(FormatMsg(msg, "red"));
        }
    });
}
function daoshiyuanaa() {
    DoAjax("/AjaxRequest/AccountHandler.php", { Action: "daoshiyuanaa" }, function (msg) {
        HideLoading();
        if (msg.indexOf("成功") > 0) {
            ShowModal(FormatMsg(msg, "green"));
        } else {
            ShowModal(FormatMsg(msg, "red"));
        }
    });
}
function daoshiyuanaaa() {
    DoAjax("/AjaxRequest/AccountHandler.php", { Action: "daoshiyuanaaa" }, function (msg) {
        HideLoading();
        if (msg.indexOf("成功") > 0) {
            ShowModal(FormatMsg(msg, "green"));
        } else {
            ShowModal(FormatMsg(msg, "red"));
        }
    });
}
function daoshiyuanbbb() {
    DoAjax("/AjaxRequest/AccountHandler.php", { Action: "daoshiyuanbbb" }, function (msg) {
        HideLoading();
        if (msg.indexOf("成功") > 0) {
            ShowModal(FormatMsg(msg, "green"));
        } else {
            ShowModal(FormatMsg(msg, "red"));
        }
    });
}
function daoshiyuanccc() {
    DoAjax("/AjaxRequest/AccountHandler.php", { Action: "daoshiyuanccc" }, function (msg) {
        HideLoading();
        if (msg.indexOf("成功") > 0) {
            ShowModal(FormatMsg(msg, "green"));
        } else {
            ShowModal(FormatMsg(msg, "red"));
        }
    });
}
function daoshiyuanddd() {
    DoAjax("/AjaxRequest/AccountHandler.php", { Action: "daoshiyuanddd" }, function (msg) {
        HideLoading();
        if (msg.indexOf("成功") > 0) {
            ShowModal(FormatMsg(msg, "green"));
        } else {
            ShowModal(FormatMsg(msg, "red"));
        }
    });
}
function daoshiyuaneee() {
    DoAjax("/AjaxRequest/AccountHandler.php", { Action: "daoshiyuaneee" }, function (msg) {
        HideLoading();
        if (msg.indexOf("成功") > 0) {
            ShowModal(FormatMsg(msg, "green"));
        } else {
            ShowModal(FormatMsg(msg, "red"));
        }
    });
}
function daoshiyuanfff() {
    DoAjax("/AjaxRequest/AccountHandler.php", { Action: "daoshiyuanfff" }, function (msg) {
        HideLoading();
        if (msg.indexOf("成功") > 0) {
            ShowModal(FormatMsg(msg, "green"));
        } else {
            ShowModal(FormatMsg(msg, "red"));
        }
    });
}
function daoshiyuanggg() {
    DoAjax("/AjaxRequest/AccountHandler.php", { Action: "daoshiyuanggg" }, function (msg) {
        HideLoading();
        if (msg.indexOf("成功") > 0) {
            ShowModal(FormatMsg(msg, "green"));
        } else {
            ShowModal(FormatMsg(msg, "red"));
        }
    });
}
function daoshiyuanhhh() {
    DoAjax("/AjaxRequest/AccountHandler.php", { Action: "daoshiyuanhhh" }, function (msg) {
        HideLoading();
        if (msg.indexOf("成功") > 0) {
            ShowModal(FormatMsg(msg, "green"));
        } else {
            ShowModal(FormatMsg(msg, "red"));
        }
    });
}
function daoshiyuankkk() {
    DoAjax("/AjaxRequest/AccountHandler.php", { Action: "daoshiyuankkk" }, function (msg) {
        HideLoading();
        if (msg.indexOf("成功") > 0) {
            ShowModal(FormatMsg(msg, "green"));
        } else {
            ShowModal(FormatMsg(msg, "red"));
        }
    });
}
function wushiyuanaa() {
    DoAjax("/AjaxRequest/AccountHandler.php", { Action: "wushiyuanaa" }, function (msg) {
        HideLoading();
        if (msg.indexOf("成功") > 0) {
            ShowModal(FormatMsg(msg, "green"));
        } else {
            ShowModal(FormatMsg(msg, "red"));
        }
    });
}
function yibaiyuanaa() {
    DoAjax("/AjaxRequest/AccountHandler.php", { Action: "yibaiyuanaa" }, function (msg) {
        HideLoading();
        if (msg.indexOf("成功") > 0) {
            ShowModal(FormatMsg(msg, "green"));
        } else {
            ShowModal(FormatMsg(msg, "red"));
        }
    });
}
function wuxianbangdingyuanbao() {
    DoAjax("/AjaxRequest/AccountHandler.php", { Action: "wuxianbangdingyuanbao" }, function (msg) {
        HideLoading();
        if (msg.indexOf("成功") > 0) {
            ShowModal(FormatMsg(msg, "green"));
        } else {
            ShowModal(FormatMsg(msg, "red"));
        }
    });
}
function GetYuanBaoFromUser() {
    DoAjax("/AjaxRequest/AccountHandler.php", { Action: "GetYuanBaoFromUser" }, function (msg) {
        HideLoading();
        if (msg.indexOf("成功") > 0) {
            ShowModal(FormatMsg(msg, "green"));
            $("#tabs").tabs("refresh");
        } else if (msg.indexOf("充值") > 0) {
            ShowModalAndOpenNewWindow(FormatMsg(msg, "red"), PayUrl);
        } else {
            ShowModal(FormatMsg(msg, "red"));
        }
    });
}

function FreeRwardCash(oid) {
    DoAjax("/AjaxRequest/PlayInfoHandeler.php", { Action: "FreeRwardCash", oId: oid }, function (msg) {
        HideLoading();
        if (msg.indexOf("成功") > 0) {
            ShowModal(FormatMsg(msg, "green"));
            $("#tabs").tabs("refresh");
        } else {
            ShowModal(FormatMsg(msg, "red"));
        }
    });
}

function FreeRwardGold(oid) {
    DoAjax("/AjaxRequest/PlayInfoHandeler.php", { Action: "FreeRwardGold", oId: oid }, function (msg) {
        HideLoading();
        if (msg.indexOf("成功") > 0) {
            ShowModal(FormatMsg(msg, "green"));
            $("#tabs").tabs("refresh");
        } else {
            ShowModal(FormatMsg(msg, "red"));
        }
    });
}

function RwardLevelGold(oid) {
    DoAjax("/AjaxRequest/PlayInfoHandeler.php", { Action: "RwardLevelGold", oId: oid }, function (msg) {
        HideLoading();
        if (msg.indexOf("成功") > 0) {
            ShowModal(FormatMsg(msg, "green"));
            $("#tabs").tabs("refresh");
        } else {
            ShowModal(FormatMsg(msg, "red"));
        }
    });
}

function RoleBuyExp(oid, buyType) {
    DoAjax("/AjaxRequest/PlayInfoHandeler.php", { Action: "RoleBuyExp", oId: oid, buyType: buyType }, function (msg) {
        HideLoading();
        if (msg.indexOf("成功") > 0) {
            ShowModal(FormatMsg(msg, "green"));
            $("#tabs").tabs("refresh");
        } else if (msg.indexOf("充值") > 0) {
            ShowModalAndOpenNewWindow(FormatMsg(msg, "red"), PayUrl);
        } else {
            ShowModal(FormatMsg(msg, "red"));
        }
    });
}

function PetBuyExp(rOid, pOid, buyType) {
    DoAjax("/AjaxRequest/PetInfoHandeler.php", { Action: "PetBuyExp", rOid: rOid, pOid: pOid, buyType: buyType }, function (msg) {
        HideLoading();
        if (msg.indexOf("成功") > 0) {
            ShowModal(FormatMsg(msg, "green"));
            $("#tabs").tabs("refresh");

        } else if (msg.indexOf("充值") > 0) {
            ShowModalAndOpenNewWindow(FormatMsg(msg, "red"), PayUrl);
        } else {
            ShowModal(FormatMsg(msg, "red"));
        }
    });
}

function PetRebirth(rOid, pOid) {
    DoAjax("/AjaxRequest/PetInfoHandeler.php", { Action: "PetRebirth", rOid: rOid, pOid: pOid }, function (msg) {
        HideLoading();
        if (msg.indexOf("成功") > 0) {
            ShowModal(FormatMsg(msg, "green"));
            $("#tabs").tabs("refresh");

        } else if (msg.indexOf("充值") > 0) {
            ShowModalAndOpenNewWindow(FormatMsg(msg, "red"), PayUrl);
        } else {
            ShowModal(FormatMsg(msg, "red"));
        }
    });
}

function BuyMallItem(itemId) {
    DoAjax("/AjaxRequest/MallShopHandler.php", { Action: "BuyMallItem", ItemId: itemId }, function (msg) {
        HideLoading();
        if (msg.indexOf("成功") > 0) {
            ShowModal(FormatMsg(msg, "green"));
        } else if (msg.indexOf("充值") > 0) {
            ShowModalAndOpenNewWindow(FormatMsg(msg, "red"), PayUrl);
        } else {
            ShowModal(FormatMsg(msg, "red"));
        }
    });
}

