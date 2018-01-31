function DoAjax(url, data, successCallBack) {
    $.ajax({
        url: url,
        type: "POST",
        data: data,
        cache: false,
        error: function () { HideLoading(); ShowModal("<b class=\"red\">网络繁忙，请稍后再试。</b>"); },
        success: successCallBack,
        beforeSend: function () { ShowLoading(); }
    });
}

function ShowLoading() {
    $("#loadding").showLoading({ 'addClass': 'loading-indicator-bars' });
}
function HideLoading() {
    $("#loadding").hideLoading();
}
function GetParasValue(paras) {
    var url = location.href;
    var paraString = url.substring(url.indexOf("?") + 1, url.length).split("&");
    var paraObj = {};
    var j;
    for (var i = 0; j = paraString[i]; i++) {
        paraObj[j.substring(0, j.indexOf("=")).toLowerCase()] = j.substring(j.indexOf("=") + 1, j.length);
    }
    var returnValue = paraObj[paras.toLowerCase()];
    if (typeof (returnValue) == "undefined") {
        return "";
    } else {
        return returnValue;
    }
}

function FormatMsg(msg, className) {
    return "<b class=\"" + className + "\">" + msg + "</b>";
}

//普通模态框
function ShowModal(msg) {
    $.fn.jmodal({
        title: '系统提示',
        content: msg,
        buttonText: { ok: '确定', cancel: '取消' },
        okEvent: function (obj, args) {
            args.complete();
        }
    });
}

//模态框，带跳转
function ShowModalAndRedirect(msg, href) {
    $.fn.jmodal({
        title: '系统提示',
        content: msg,
        buttonText: { ok: '确定', cancel: '取消' },
        okEvent: function (obj, args) {
            if (href == "") {
                href = GetParasValue("ReturnUrl");
            }
            window.location.href = href;
            args.complete();
        }
    });
}

//模态框，带跳转(打开新窗口)
function ShowModalAndOpenNewWindow(msg, href) {
    $.fn.jmodal({
        title: '系统提示',
        content: msg,
        buttonText: { ok: '确定', cancel: '取消' },
        okEvent: function (obj, args) {
            window.open(href);
            args.complete();
        }
    });
}

//弹出模态框，点确定之后执行回调
function ShowModalCallFun(msg, callBack) {
    $.fn.jmodal({
        title: '系统提示',
        content: msg,
        buttonText: { ok: '确定', cancel: '取消' },
        okEvent: function (obj, args) {
            callBack();
            args.complete();
        }
    });
}