using Toybox.WatchUi;
using Toybox.Graphics;
using Toybox.System;
using Toybox.Lang;
using Toybox.Application;
using Toybox.Math;

class retrowatchesView extends WatchUi.WatchFace {

	var uiH;
	var inLowPower=false;

    function initialize() {
        WatchFace.initialize();
        
        uiH = new helper();
        
        uiH.debug = false;
    }
    
    function onExitSleep() {
        inLowPower=false;
    	WatchUi.requestUpdate(); 
    }

    function onEnterSleep() {
    	inLowPower=true;
    	WatchUi.requestUpdate(); 
    }

	function draw_vivoactiveHR(dc){
		var x = 45;
  		var xadj = 55;
      	uiH.drawHours(dc,x,-15,xadj,0,uiH.fontHuge45());
    	uiH.drawMinutes(dc,x,75,xadj,0,uiH.fontHuge45());
    	
//    	uiH.drawTop(dc,109,-3,uiH.fontMedium(),Graphics.TEXT_JUSTIFY_CENTER);
    	uiH.drawLeft(dc,10,178,uiH.fontMedium(),Graphics.TEXT_JUSTIFY_LEFT);
    	uiH.drawRight(dc,138,178,uiH.fontMedium(),Graphics.TEXT_JUSTIFY_RIGHT);
    	uiH.drawBluetoothConnectionSmall(dc,11,74);
	}
	
	function draw_fr920xt(dc){
		var xadj = 45;
      	uiH.drawHours(dc,37,-20,xadj,0,uiH.fontHuge45());
    	uiH.drawMinutes(dc,120,45,xadj,0,uiH.fontHuge45());
    	
//    	uiH.drawTop(dc,109,-3,uiH.fontMedium(),Graphics.TEXT_JUSTIFY_CENTER);
    	uiH.drawLeft(dc,3,118,uiH.fontMedium(),Graphics.TEXT_JUSTIFY_LEFT);
    	uiH.drawRight(dc,200,0,uiH.fontMedium(),Graphics.TEXT_JUSTIFY_RIGHT);
    	uiH.drawBluetoothConnection(dc,38,82);
	}
	
	function draw_fr230_fr235(dc){
		var x = 73;
		var xadj = 65;
      	uiH.drawHours(dc,x,-15,xadj,0,uiH.fontHuge45());
    	uiH.drawMinutes(dc,x,74,xadj,0,uiH.fontHuge45());
    	
//    	uiH.drawTop(dc,109,-3,uiH.fontMedium(),Graphics.TEXT_JUSTIFY_CENTER);
    	uiH.drawLeft(dc,-3,77,uiH.fontSmall(),Graphics.TEXT_JUSTIFY_LEFT);
    	uiH.drawRight(dc,218,77,uiH.fontSmall(),Graphics.TEXT_JUSTIFY_RIGHT);
    	uiH.drawBluetoothConnectionSmall(dc,195,100);
	}
	
	function draw_fenix3(dc){
		var x = 75;
		var xadj = 65;
      	uiH.drawHours(dc,x,5,xadj,0,uiH.fontHuge45());
    	uiH.drawMinutes(dc,x,95,xadj,0,uiH.fontHuge45());
    	
    	uiH.drawTop(dc,109,0,uiH.fontSmall(),Graphics.TEXT_JUSTIFY_CENTER);
    	uiH.drawLeft(dc,-1,98,uiH.fontSmall(),Graphics.TEXT_JUSTIFY_LEFT);
    	uiH.drawRight(dc,218,98,uiH.fontSmall(),Graphics.TEXT_JUSTIFY_RIGHT);
    	uiH.drawBluetoothConnectionSmall(dc,109,191);
	}
	
	function draw_fr45(dc){
      	var x = 68;
		var xadj = 70;
      	uiH.drawHours(dc,x,0,xadj,0,uiH.fontHuge45());
    	uiH.drawMinutes(dc,x,88,xadj,0,uiH.fontHuge45());
    	
    	//uiH.drawTop(dc,104,0,uiH.fontMedium(),Graphics.TEXT_JUSTIFY_CENTER);
    	uiH.drawLeft(dc,-3,94,uiH.fontSmall(),Graphics.TEXT_JUSTIFY_LEFT);
    	uiH.drawRight(dc,210,94,uiH.fontSmall(),Graphics.TEXT_JUSTIFY_RIGHT);
    	uiH.drawBluetoothConnectionSmall(dc,104,183);
	}
	
	function draw_fr245_fenix5x(dc) {
		var x = 83;
		var xadj = 75;
      	uiH.drawHours(dc,x,15,xadj,0,uiH.fontHuge45());
    	uiH.drawMinutes(dc,x,110,xadj,0,uiH.fontHuge45());
    	
    	uiH.drawTop(dc,120,0,uiH.fontMedium(),Graphics.TEXT_JUSTIFY_CENTER);
    	uiH.drawLeft(dc,-1,108,uiH.fontMedium(),Graphics.TEXT_JUSTIFY_LEFT);
    	uiH.drawRight(dc,240,108,uiH.fontMedium(),Graphics.TEXT_JUSTIFY_RIGHT);
    	uiH.drawBluetoothConnection(dc,120,204);
	}
		
	function draw_fenix6(dc){
      	uiH.drawHours(dc,85,0,89,0,uiH.fontHuge245());
    	uiH.drawMinutes(dc,85,111,90,0,uiH.fontHuge245());
    	
    	uiH.drawTop(dc,130,2,uiH.fontMedium(),Graphics.TEXT_JUSTIFY_CENTER);
    	uiH.drawLeft(dc,-1,115,uiH.fontMedium(),Graphics.TEXT_JUSTIFY_LEFT);
    	uiH.drawRight(dc,260,115,uiH.fontMedium(),Graphics.TEXT_JUSTIFY_RIGHT);
    	uiH.drawBluetoothConnectionSmall(dc,130,233);
	}
	
	function draw_fenix6xpro(dc){
      	uiH.drawHours(dc,88,3,90,0,uiH.fontHuge245());
    	uiH.drawMinutes(dc,88,118,90,0,uiH.fontHuge245());
    	
    	uiH.drawTop(dc,140,2,uiH.fontMedium(),Graphics.TEXT_JUSTIFY_CENTER);
    	uiH.drawRight(dc,278,120,uiH.fontMedium(),Graphics.TEXT_JUSTIFY_RIGHT);
    	uiH.drawLeft(dc,2,120,uiH.fontMedium(),Graphics.TEXT_JUSTIFY_LEFT);
    	uiH.drawBluetoothConnection(dc,140,240);
	}
	
	function draw_venu(dc){	
//		uiH.debug=true;

		if(uiH.debug || inLowPower && uiH.canBurn()){
			var step = 4;
			var r = (360/step) * (System.getClockTime().min);
			var radians=Math.toRadians(r);
			var hx = Math.cos(radians)*100;
			var hy = Math.sin(radians)*70;
			uiH.drawHours(dc,170+hx,65+hy,50,0,uiH.fontHuge45());
			uiH.drawMinutes(dc,170+hx,200+hy,50,0,uiH.fontHuge45());
			if(uiH.debug){
				for(var r=0; r<360;r+=(360/step)){
					radians=Math.toRadians(r);
					hx = Math.cos(radians)*100;
					hy = Math.sin(radians)*70;
					uiH.drawHours(dc,170+hx,65+hy,50,0,uiH.fontHuge45());
					uiH.drawMinutes(dc,170+hx,200+hy,50,0,uiH.fontHuge45());
				}
			}
		}else{
			uiH.drawTop(dc,195,6,uiH.fontMedium(),Graphics.TEXT_JUSTIFY_CENTER);
			uiH.drawRight(dc,375,185,uiH.fontMedium(),Graphics.TEXT_JUSTIFY_RIGHT);
			uiH.drawLeft(dc,15,185,uiH.fontMedium(),Graphics.TEXT_JUSTIFY_LEFT);
			uiH.drawBluetoothConnection(dc,195,345);
			uiH.drawHours(dc,145,45,95,0,uiH.fontHuge245());
			uiH.drawMinutes(dc,145,190,95,0,uiH.fontHuge245());
		}			
	}
	
    function onUpdate(dc) {
//		System.println(System.getDeviceSettings().screenWidth);
//		System.println(System.getDeviceSettings().screenHeight);
		
		if(uiH.ifScreen(390,390,1)){
			uiH.setColorsOled(dc,inLowPower);
			draw_venu(dc);	
			return;
		}
		
		uiH.setColors(dc);
		if(uiH.ifScreen(148,205,3)){
			draw_vivoactiveHR(dc);
			return;
		}
		if(uiH.ifScreen(205,148,3)){
			draw_fr920xt(dc);
			return;
		}		
		if(uiH.ifScreen(215,180,2)){
			draw_fr230_fr235(dc);
			return;
		}
		if(uiH.ifScreen(208,208,1)){
			draw_fr45(dc);	
			return;
		}
		if(uiH.ifScreen(218,218,1)){
			draw_fenix3(dc);	
			return;
		}
		if(uiH.ifScreen(240,240,1)){
			draw_fr245_fenix5x(dc);	 // most popular size
			return;
		}
		if(uiH.ifScreen(260,260,1)){
			draw_fenix6(dc);	
			return;
		}
		if(uiH.ifScreen(280,280,1)){
			draw_fenix6xpro(dc);	
			return;
		}
    }

}
