/**
 * 
 * Copyright 2007-2009
 * 
 * Paulius Uza
 * http://www.uza.lt
 * 
 * Dan Florio
 * http://www.polygeek.com
 * 
 * Arif Ali Saiyed
 * http://arif-ali-saiyed.blogspot.com/
 * 
 * Project website:
 * http://code.google.com/p/custom-context-menu/
 * 
 * --
 * RightClick for Flash Player. 
 * Version 0.6.2
 * 
 */

var RightClick = {
	/**
	 *  Constructor
	 */ 
	init: function () {
		this.FlashObjectID = "gameSwf";
		this.FlashContainerID = "GameFrameContainer";
		this.Cache = this.FlashObjectID;
		if(window.addEventListener){
			 window.addEventListener("mousedown", this.onGeckoMouse(), true);
		} else {
			//alert("666");
			document.getElementById(this.FlashContainerID).onmouseup = RightClick.onIEMouseUp;
			//alert("bbb" + document.getElementById(this.FlashContainerID));
			//alert(document.getElementById(this.FlashContainerID).name);
			//RightClick.Cache = "nan";
			document.oncontextmenu = function(){ return false}
			document.getElementById(this.FlashContainerID).onmousedown = RightClick.onIEMouseDown;
		}
	},
	/**
	 *  Disable the Right-Click event trap  and continue showing flash player menu
	 */ 
	UnInit: function () { 
	    //alert('Un init is called' );			
		if(window.RemoveEventListener){
			alert('Un init is called for GECKO' );			
			window.addEventListener("mousedown", null, true);
			window.RemoveEventListener("mousedown",this.onGeckoMouse(),true);
			 //w//indow.releaseEvents("mousedown");
		} else {
			//alert('Un init is called for IE' );							
			document.getElementById(this.FlashContainerID).onmouseup = "" ;
			document.oncontextmenu = "";
			document.getElementById(this.FlashContainerID).onmousedown = "";
		}
	},

	/**
	 * GECKO / WEBKIT event overkill
	 * @param {Object} eventObject
	 */
	killEvents: function(eventObject) {
		if(eventObject) {
			if (eventObject.stopPropagation) eventObject.stopPropagation();
			if (eventObject.preventDefault) eventObject.preventDefault();
			if (eventObject.preventCapture) eventObject.preventCapture();
	   		if (eventObject.preventBubble) eventObject.preventBubble();
		}
	},
	/**
	 * GECKO / WEBKIT call right click
	 * @param {Object} ev
	 */
	onGeckoMouse: function(ev) {
	  	return function(ev) {
	    if (ev.button != 0) {
			RightClick.killEvents(ev);
			if(ev.target.id == RightClick.FlashObjectID && RightClick.Cache == RightClick.FlashObjectID) {
	    		//RightClick.call(2,0,0);
			}
			RightClick.Cache = ev.target.id;
		}
	  }
	},
	/**
	 * IE call right click
	 * @param {Object} ev
	 */
	onIEMouseDown: function() {
	  	if (event.button > 1) {
//			if(window.event.srcElement.id == RightClick.FlashObjectID && RightClick.Cache == RightClick.FlashObjectID) {
//				
//			}
			//RightClick.call(2,0,0); 
			document.getElementById(RightClick.FlashContainerID).setCapture();
//			if(window.event.srcElement.id)
//			RightClick.Cache = window.event.srcElement.id;
			//document.onmousemove = RightClick.onIEMouseMove;
		}
	},
	/**
	 * IE call right click
	 * @param {Object} ev
	 */
	onIEMouseUp: function() 
	{
	  	document.getElementById(RightClick.FlashContainerID).releaseCapture();
		if (event.button > 1) {
	  		//RightClick.call(3,0,0); 
		}
		//document.onmousemove = null;
	},
	/**
	 * IE call right click
	 * @param {Object} ev
	 */
	onIEMouseMove: function(e) 
	{
		e = e || window.event;
		
	  	RightClick.call(5,e.clientX,e.clientY);
	},
	/**
	 * Main call to Flash External Interface
	 */
	call: function(code,x,y) {
		swf = document.getElementById(this.FlashObjectID);  
		if(swf == undefined )
		{
			alert("no swf found");
			return;
		}
		swf.ClientCallJs(code,x,y);
		//document.frames["game"].document.getElementById(this.FlashObjectID).ClientCallJs(1);
	}
}