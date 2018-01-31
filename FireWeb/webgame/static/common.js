// JavaScript Document
var $ = function(id) {
	return document.getElementById(id);
}

function getQueryParamValue(p) {
	var url = document.URL.toString();
	var tmpStr = p + "=";
	var tmp_reg = eval("/[\?&]" + tmpStr + "/i");
	if (url.search(tmp_reg) == -1)
		return null;
	else {
		var a = url.split(/[\?&]/);
		for ( var i = 0; i < a.length; i++)
			if (a[i].search(eval("/^" + tmpStr + "/i")) != -1)
				return a[i].substring(tmpStr.length);
	}
}

function getParams() {
	var params = new Object();
	var query = document.location.search.substr(1);
	var pairs = query.split("&");
	for ( var i = 0; i < pairs.length; i++) {
		var index = pairs[i].indexOf("=");
		if (index <= 0) {
			continue;
		}
		var paramName = pairs[i].substr(0, index);
		var paramValue = pairs[i].substr(index + 1);
		params[paramName] = paramValue;
	}
	return params;
}

function ClientCallJs(code, x, y) {
	swf = document.getElementById("gameSwf");
	if (swf == undefined) {
		alert("no swf found");
		return;
	}
	swf.ClientCallJs(code);
	// window.external.JsCallClient(1,2)

	// alert(code + " " + x + " " + y);
	// getFlashMovieObject("wushuang").systemRightClick(x,y);//js����flash�еķ���
}

function JsCallClient(code, a, b) {
	window.external.JsCallClient(code, a, b)
}

function addBookmark(title, url) {
	if (window.sidebar) {
		window.sidebar.addPanel(title, url, "");
	} else if (document.all) {
		top.external.AddFavorite(url, title);
	} else if (window.opera && window.print) {
		return true;
	}
}

function setValue(o) {

	swf = document.getElementById("gameSwf");
	if (swf == undefined) {
		alert("no swf found");
		return;
	}
	return swf;
}

function thisMovie(movieName) {
	if (navigator.appName.indexOf("Microsoft") != -1) {

		return window[movieName];
	} else {

		return document[movieName];
	}
}

function getFlashMovieObject(movieName) {
	if (window.document[movieName]) {
		return window.document[movieName];
	}
	if (navigator.appName.indexOf("Microsoft") == -1) {
		if (document.embeds && document.embeds[movieName])
			return document.embeds[movieName];
	} else {
		return document.getElementById(movieName);
	}
}

/**
 * 获取flash版本号
 * @returns {String}
 */
function _uFlash() {
	var f = "-", n = navigator;
	if (n.plugins && n.plugins.length) {
		for ( var ii = 0; ii < n.plugins.length; ii++) {
			if (n.plugins[ii].name.indexOf('Shockwave Flash') != -1) {
				// alert(n.plugins[ii].name);
				// alert(n.plugins[ii].description);
				f = n.plugins[ii].description.split('Shockwave Flash ')[1];
				break;
			}
		}
	} else if (window.ActiveXObject) {
		for ( var ii = 10; ii >= 2; ii--) {
			try {
				var fl = eval("new ActiveXObject('ShockwaveFlash.ShockwaveFlash."
						+ ii + "');");
				if (fl) {
					f = ii + '.0';
					break;
				}
			} catch (e) {
			}
		}
	}
	return f;
}

/**
 * 返回flash下载地址
 * @returns {String}
 */
function flashDown() {
	if (window.ActiveXObject) {
		return '/download/lhzs_activx.exe';
	} else {
		return '/download/lhzs_plugin.exe';
	}

}
