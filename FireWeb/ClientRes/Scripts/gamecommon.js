function addfavor(url,title){
	try {
        window.external.addFavorite(url,title);
    } catch (e) {
        try {
            window.sidebar.addPanel(title, url, "");
        } catch (e) {
            alert("加入收藏失败，请使用Ctrl+D进行添加");
        }
    }   
}

function SetHome(obj,vrl)
    {
        try
        {
                obj.style.behavior='url(#default#homepage)';
				obj.setHomePage(vrl);
        }
        catch(e){
                if(window.netscape) {
                        try {
                                netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect"); 
                        } 
                        catch (e) { 
                                alert("此操作被浏览器拒绝！\n请在浏览器地址栏输入“about:config”并回车\n然后将[signed.applets.codebase_principal_support]设置为'true'"); 
                        }
                        var prefs = Components.classes['@mozilla.org/preferences-service;1'].getService(Components.interfaces.nsIPrefBranch);
                        prefs.setCharPref('browser.startup.homepage',vrl);
                 }
        }
    }


function Ajax() {	
	var xmlHttpReq = null;
	if (window.XMLHttpRequest) {
		xmlHttpReq = new XMLHttpRequest();
	} else {
  		if (window.ActiveXObject) {
			var versions = ['Microsoft.XMLHTTP', 'MSXML.XMLHTTP', 'Microsoft.XMLHTTP',
							'Msxml2.XMLHTTP.7.0', 'Msxml2.XMLHTTP.6.0',
							'Msxml2.XMLHTTP.5.0', 'Msxml2.XMLHTTP.4.0', 
							'MSXML2.XMLHTTP.3.0', 'MSXML2.XMLHTTP'];
			for(var i=0; i<versions.length; i++) {
				try {
					xmlHttpReq = new ActiveXObject(versions[i]);
					if(xmlHttpReq) {
						break;
					}
				} catch(e) {}
			}
  		}
	}
	
	var handler = null;
	
	this.invoke = function (mode, url, value, _handler) {
	  handler = _handler;
	  if(mode == 'get') {
		  var querystring = url;
		  if (url.indexOf("?") > -1) {
			  if (value != null && value != "") {
				  querystring += '&'+value+'&'+Math.random();
			  }
		  } else {
			  if (value != null && value != "") {
				  querystring += '?'+value+'&'+Math.random();
			  }
		  }
		
		if(window.XMLHttpRequest) {
		  xmlHttpReq.open('GET', querystring);
		  xmlHttpReq.onreadystatechange = this.callback;
		 try{
		 	xmlHttpReq.send(null);
		 }catch(e){}
		} else {
		  xmlHttpReq.open('GET', querystring, true);
		  xmlHttpReq.onreadystatechange = this.callback;
		  xmlHttpReq.send();
		}
	  }
	  else if(mode == 'post') {
		xmlHttpReq.open('POST', url);
		xmlHttpReq.onreadystatechange = this.callback;
		xmlHttpReq.setRequestHeader('Content-Type',
	 'application/x-www-form-urlencoded');
		xmlHTTP.setRequestHeader("contentType","text/html;charset=uft-8");
		xmlHttpReq.send(value);
	  }
	};
		
	this.callback = function () {
	  if (xmlHttpReq.readyState == 4) {
		if (xmlHttpReq.status == 200) {
			if (handler) {
				handler(xmlHttpReq.responseText);
			}
		} else {
			//
		}
	  }
	};
}

var ajax = new Ajax();

function intoFullScreen() {
	if (document.getElementById('container').style.height == "100%") {
		exitFullScreen();
	} else {
		document.getElementById('container').style.height = "100%";
		document.getElementById('container').style.width = "100%";
		document.getElementById('Main').style.height = "100%";
		document.getElementById('Main').style.width = "100%";
		ajax.invoke("get", "/user/user_interface.php?ac=set_fullscreen", "", null);
	}
}

function intoFullScreen2() {
    document.getElementById("container").style.width="1200";
    document.getElementById("container").style.height="600";
    document.getElementById("Main").style.width="1200";
    document.getElementById("Main").style.height="600";
}

function exitFullScreen() {
	if (document.getElementById('container').style.height == "580px") {
		intoFullScreen();
	} else {
		document.getElementById('container').style.height = "580px";
		document.getElementById('container').style.width = "1002px";
		document.getElementById('Main').style.height = "580px";
		document.getElementById('Main').style.width = "1002px";
		ajax.invoke("get", "/user/user_interface.php?ac=exit_fullscreen", "", null);
	}
}
