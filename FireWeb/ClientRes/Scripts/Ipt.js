/// <reference path="jquery.min.js" />
//Register
$(function () {
    $("#u_name").focus(function () {
        focusNameStyle()
    }).blur(function () {
        blurNameStyle();
    });
    $("#u_pas").focus(function () {
        focusPassStyle();
    }).blur(function () {
        blurPassStyle();
    })
    $("#u_pas1").focus(function () {
        focusPass1Style()
    }).blur(function () {
        blurPass1Style();
    })
    $("#o_pas").focus(function () {
        focusOPassStyle();
    }).blur(function () {
        blurOPassStyle();
    })
    $("#u_mail").focus(function () {
        focusUMailStyle();
    }).blur(function () {
        blurUMailStyle();
    })
    $("#r_mail").focus(function () {
        focusRMailStyle()
    }).blur(function () {
        blurRMailStyle()
    })
    $("#s_code").focus(function () {
	
        focusSCodeStyle();
    }).blur(function () {
        blurSCodeStyle();
    })
    focusName();
    focusOPas()
    focusUMail();
})
function ckName() {
    var uName = $.trim($("#u_name").val());
    if (uName.length < 4 || uName.length > 16) {
        return false;
    }
    return true;
}
function ckPas() {
    var uPas = $.trim($("#u_pas").val());
    if (uPas.length < 4 || uPas.length > 16) {
        return false;
    }
    return true;
}
function ckPas1() {
    var uPas1 = $.trim($("#u_pas1").val());
    if (uPas1.length < 4 || uPas1.length > 16) {
        return false;
    }
    return true;
}
function ckPasAndPas1() {
    var uPas = $.trim($("#u_pas").val());
    var uPas1 = $.trim($("#u_pas1").val());
    if (uPas1 != uPas) {
        return false;
    }
    return true;
}

function ckOldPas() {
    var oPas = $.trim($("#o_pas").val());
    if (oPas.length < 4 || oPas.length > 16) {
        return false;
    }
    return true;
}

function ckEmail() {
    var breg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
    var uEmail = $.trim($("#u_mail").val());
    if (uEmail.length < 8 || uEmail.length > 24 || !breg.test(uEmail)) {
        return false;
    }
    else {
        return true;
    }
}

function ckREmail() {
    var uEmail = $.trim($("#u_mail").val());
    var rEmail = $.trim($("#r_mail").val());
    if (uEmail != rEmail) {
        return false;
    }
    else {
        return true;
    }
}

function ckSafeCode() {
    var sCode = $.trim($("#s_code").val());
    if (sCode.length != 4) {
        return false;
    }
    return true;
}

function focusNameStyle() {
    $("#u_name").parent("span.at_text").removeClass("t_1_e").addClass("t_1_i");
    $("#u_name").next("em").removeClass().addClass("on").html("• 长度为4-16字符 (只能英文和数字)");
}
function blurNameStyle() {
    if (!ckName()) {
        $("#u_name").parent("span.at_text").removeClass("t_1_i").addClass("t_1_e");
        $("#u_name").next("em").removeClass().addClass("orr").html("<u class=\"at_msg m_3_e\"></u>长度为4-16字符 (1个汉字等于2字符)");
        return false;
    } else {
        $("#u_name").parent("span.at_text").removeClass("t_1_i t_1_e").addClass("t_1_o");
        $("#u_name").next("em").removeClass().html("<u class=\"at_msg m_3_o\"></u>");
        return true;
    }
}
function focusPassStyle() {
    $("#u_pas").parent("span.at_text").removeClass("t_1_e").addClass("t_1_i");
    $("#u_pas").next("em").removeClass().addClass("on").html("• 密码由6~16位字母、数字或特殊符号组成)");
}
function blurPassStyle() {
    if (!ckPas()) {
        $("#u_pas").parent("span.at_text").removeClass("t_1_i").addClass("t_1_e");
        $("#u_pas").next("em").removeClass().addClass("orr").html("<u class=\"at_msg m_3_e\"></u>密码应为6-16个字符");
        return false;
    } else {
        $("#u_pas").parent("span.at_text").removeClass("t_1_i t_1_e").addClass("t_1_o");
        $("#u_pas").next("em").removeClass().html("<u class=\"at_msg m_3_o\"></u>");
        return true;
    }
}
function focusPass1Style() {
    $("#u_pas1").parent("span.at_text").removeClass("t_1_e").addClass("t_1_i");
    $("#u_pas1").next("em").removeClass().addClass("on").html("• 再一次输入您的密码");
}
function blurPass1Style() {
    if (!ckPasAndPas1()) {
        $("#u_pas1").parent("span.at_text").removeClass("t_1_i").addClass("t_1_e");
        $("#u_pas1").next("em").removeClass().addClass("orr").html("<u class=\"at_msg m_3_e\"></u>两次输入的密码不一致");
        return false;
    } else {
        $("#u_pas1").parent("span.at_text").removeClass("t_1_i t_1_e").addClass("t_1_o");
        $("#u_pas1").next("em").removeClass().html("<u class=\"at_msg m_3_o\"></u>");
        return true;
    }
}

function focusOPassStyle() {
    $("#o_pas").parent("span.at_text").removeClass("t_1_e").addClass("t_1_i");
    $("#o_pas").next("em").removeClass().addClass("on").html("• 请输入您当前的密码)");
}

function blurOPassStyle() {
    if (!ckOldPas()) {
        $("#o_pas").parent("span.at_text").removeClass("t_1_i").addClass("t_1_e");
        $("#o_pas").next("em").removeClass().addClass("orr").html("<u class=\"at_msg m_3_e\"></u>密码应为6-16个字符");
        return false;
    } else {
        $("#o_pas").parent("span.at_text").removeClass("t_1_i t_1_e").addClass("t_1_o");
        $("#o_pas").next("em").removeClass().html("<u class=\"at_msg m_3_o\"></u>");
        return true;
    }
}

function focusUMailStyle() {
    $("#u_mail").parent("span.at_text").removeClass("t_1_e").addClass("t_1_i");
    $("#u_mail").next("em").removeClass().addClass("on").html("• 请输入您常用的邮箱地址");
}

function blurUMailStyle() {
    if (!ckEmail()) {
        $("#u_mail").parent("span.at_text").removeClass("t_1_i").addClass("t_1_e");
        $("#u_mail").next("em").removeClass().addClass("orr").html("<u class=\"at_msg m_3_e\"></u>请输入正确的邮箱且长度在8~24位之间");
        return false;
    } else {
        $("#u_mail").parent("span.at_text").removeClass("t_1_i t_1_e").addClass("t_1_o");
        $("#u_mail").next("em").removeClass().html("<u class=\"at_msg m_3_o\"></u>");
        return true;
    }
}

function focusRMailStyle() {
    $("#r_mail").parent("span.at_text").removeClass("t_1_e").addClass("t_1_i");
    $("#r_mail").next("em").removeClass().addClass("on").html("• 请重新输入您的邮箱地址");
}

function blurRMailStyle() {
    if (!ckREmail()) {
        $("#r_mail").parent("span.at_text").removeClass("t_1_i").addClass("t_1_e");
        $("#r_mail").next("em").removeClass().addClass("orr").html("<u class=\"at_msg m_3_e\"></u>两次邮箱输入不匹配。");
        return false;
    } else {
        $("#r_mail").parent("span.at_text").removeClass("t_1_i t_1_e").addClass("t_1_o");
        $("#r_mail").next("em").removeClass().html("<u class=\"at_msg m_3_o\"></u>");
        return true;
    }
}

function focusSCodeStyle() {
    $("#s_code").parent("span.at_text").removeClass("t_1_e").addClass("t_1_i");
    $("#s_code").next().next("em").removeClass().addClass("on").html("• 请输入验证码");
}

function blurSCodeStyle() {
    if (!ckSafeCode()) {
        $("#s_code").parent("span.at_text").removeClass("t_1_i").addClass("t_1_e");
        $("#s_code").next().next("em").removeClass().addClass("orr").html("<u class=\"at_msg m_3_e\"></u>请输入正确的正确的验证码码。");
        return false;
    } else {
        $("#s_code").parent("span.at_text").removeClass("t_1_i t_1_e").addClass("t_1_o");
        $("#s_code").next().next("em").removeClass().html("<u class=\"at_msg m_3_o\"></u>");
        return true;
    }
}


function focusName() {
    $("#u_name").focus();
}
function focusOPas() {
    $("#o_pas").focus();
}
function focusUMail() {
    $("#u_mail").focus();
}