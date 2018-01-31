// JavaScript Document
var $ = function(id){ return document.getElementById(id);}

function getQueryParamValue(p)
{
	var url= document.URL.toString();
	var tmpStr=p+"=";
	var tmp_reg=eval("/[\?&]"+tmpStr+"/i");
	if(url.search(tmp_reg)==-1)return null;
	else{
		var a=url.split(/[\?&]/);
		for(var i=0;i<a.length;i++)
			 if(a[i].search(eval("/^"+tmpStr+"/i"))!=-1)return a[i].substring(tmpStr.length);
}
}

function getParams()
{
	var params = new Object();
	var query = document.location.search.substr(1);
	var pairs = query.split("&");
	for ( var i=0; i<pairs.length; i++ )
	{
		var index = pairs[i].indexOf("=");
		if ( index <= 0 )
		{
			continue;
		}
		var paramName = pairs[i].substr(0, index);
		var paramValue = pairs[i].substr(index + 1);
		params[paramName] = paramValue;
	}
	return params;
}

function ClientCallJs(code,x,y)
{
	swf = document.frames["game"].document.getElementById("gameSwf");  
	if(swf == undefined )
	{
		alert("no swf found");
		return;
	}
	swf.ClientCallJs(code);
	//window.external.JsCallClient(1,2)
	
	//alert(code + "   " + x + "   " + y);
	//getFlashMovieObject("wushuang").systemRightClick(x,y);//js调用flash中的方法 
}

function JsCallClient(code,a,b)
{
	window.external.JsCallClient(code,a,b)
}	


function addBookmark(title,url) 
{
	if (window.sidebar) 
	{
		window.sidebar.addPanel(title, url,"");
	}
	else if( document.all ) 
	{
		top.external.AddFavorite( url, title);
	}
	else if( window.opera && window.print )
	{
		return true;
	}
}

function setValue(o) 
{
	 
	swf = document.frames["game"].document.getElementById("gameSwf");  
	if(swf == undefined )
	{
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

function getFlashMovieObject(movieName)
{
  if (window.document[movieName])
  {
      return window.document[movieName];
  }
  if (navigator.appName.indexOf("Microsoft")==-1)
  {
    if (document.embeds && document.embeds[movieName])
      return document.embeds[movieName];
  }
  else
  {
    return document.getElementById(movieName);
  }
}
