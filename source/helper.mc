using Toybox.WatchUi;
using Toybox.Graphics;
using Toybox.System;
using Toybox.Lang;
using Toybox.ActivityMonitor;
using Toybox.Application;

using Toybox.Time;
using Toybox.Time.Gregorian;

class helper {

	var debug;
	
	function initialize(){
		
	}

	function fontHuge245(){ // size 140
		return WatchUi.loadResource(Rez.Fonts.fntHuge);
	}
	
	function fontHuge45(){ // size 125
		return WatchUi.loadResource(Rez.Fonts.fntHuge45);
	}
	
	function fontMedium(){
		return WatchUi.loadResource(Rez.Fonts.fntMedium);
	}
	
	function fontSmall(){ // size 23
		return WatchUi.loadResource(Rez.Fonts.fntSmall);
	}
	
	function fontIcons(){
		return WatchUi.loadResource(Rez.Fonts.icons);
	}
	
	function fontSmallIcons(){
		return WatchUi.loadResource(Rez.Fonts.smallicons);
	}

	function getWeekdayName(day){
		switch(day){
			case 1: return "sun";
			case 2: return "mon";
			case 3: return "tue";
			case 4: return "wed";
			case 5: return "thu";
			case 6: return "fri";
			case 7: return "sat";
			default: return "-";		
		}
	}
	
	function getMonthName(number){		
		switch(number){
			case 1: return "Jan";
			case 2: return "Feb";
			case 3: return "Mar";
			case 4: return "Apr";
			case 5: return "May";
			case 6: return "Jun";
			case 7: return "Jul";
			case 8: return "Aug";
			case 9: return "Sep";
			case 10: return "Oct";
			case 11: return "Nov";
			case 12: return "Dec";
			default: return "-";	
		}
	}
	
	function getHours() {
		var hours = System.getClockTime().hour;
		var clockMode = System.getDeviceSettings().is24Hour;
		if(!clockMode && hours >12){
			hours = hours-12;
		}
		return hours.format("%02d").toCharArray();
	}
	
	function getBattery(){
		if(debug){
			return "100%";
		}
		return Lang.format("$1$$2$",[System.getSystemStats().battery.format("%d"),"%"]);
	}
	
	function drawBluetoothConnectionSmall(dc,x,y){
		drawBluetoothConnection_(dc,x,y,fontSmallIcons(),Application.getApp().getProperty("BTCOnnection"));
	}
	
	function drawBluetoothConnection(dc,x,y){
		drawBluetoothConnection_(dc,x,y,fontIcons(),Application.getApp().getProperty("BTCOnnection"));
	}
	
	function drawBluetoothConnection_(dc,x,y,font,setting){
		if(setting && System.getDeviceSettings().phoneConnected){
			dc.drawText(x,y, font, "g", Graphics.TEXT_JUSTIFY_CENTER);
		}
	}
	
	function drawHours(dc,hourX,hourY,adjX,adjY,hugefont){
		var hours = getHours();
        dc.drawText(hourX,hourY,hugefont,hours[0],Graphics.TEXT_JUSTIFY_CENTER);
        dc.drawText(hourX+adjX,hourY+adjY,hugefont,hours[1],Graphics.TEXT_JUSTIFY_CENTER);
        if(debug){
	        for(var t=0;t<=2;t++){dc.drawText(hourX,hourY, hugefont, t, Graphics.TEXT_JUSTIFY_CENTER);}
	    	for(var t=0;t<=9;t++){dc.drawText(hourX+adjX,hourY+adjY, hugefont, t, Graphics.TEXT_JUSTIFY_CENTER);}
		}
	}
	
	function drawMinutes(dc,minuteX,minuteY,adjX,adjY,hugefont){		
    	var minutes = System.getClockTime().min.format("%02d").toCharArray();
    	dc.drawText(minuteX,minuteY,hugefont,minutes[0],Graphics.TEXT_JUSTIFY_CENTER);
    	dc.drawText(minuteX+adjX,minuteY+adjY,hugefont,minutes[1],Graphics.TEXT_JUSTIFY_CENTER);
    	if(debug){
	    	for(var t=0;t<=5;t++){dc.drawText(minuteX,minuteY, hugefont, t, Graphics.TEXT_JUSTIFY_CENTER);}
	    	for(var t=0;t<=9;t++){dc.drawText(minuteX+adjX,minuteY+adjY, hugefont, t, Graphics.TEXT_JUSTIFY_CENTER);}
		}
	}
	
	function drawRight(dc,x,y,font,align){
		var date = Gregorian.info(Time.now(), Time.FORMAT_SHORT);
    	dc.drawText(x,y,font,Lang.format("$1$$2$$3$",["-",date.day,"-"]),align);

    	if(debug){
    		for(var t=1;t<=31;t++) {dc.drawText(x,y,font,Lang.format("$1$$2$$3$",["-",t,"-"]),align);}
    	}
	}
	
	function drawBottom(dc,x,y,font,align){
		var date = Gregorian.info(Time.now(), Time.FORMAT_SHORT);
		var day = Lang.format("$1$$2$$3$",["-",getBattery(),"-"]);
    	dc.drawText(x,y,font,day,align);
	}
	
	function drawLeft(dc,x,y,font,align){
		var date = Gregorian.info(Time.now(), Time.FORMAT_SHORT);
		var day = Lang.format("$1$$2$$3$",["-",getWeekdayName(date.day_of_week),"-"]);
    	dc.drawText(x,y,font,day,align);
    	
    	if(debug){
    		for(var t=1;t<=7;t++) {dc.drawText(x,y,font,Lang.format("$1$$2$$3$",["-",getWeekdayName(t),"-"]),align);}
    	}
	}
	
	function drawTop(dc,x,y,font,align){
		var date = Gregorian.info(Time.now(), Time.FORMAT_SHORT);
		//getWeekdayName(date.day_of_week)
    	dc.drawText(x,y,font,Lang.format("$1$$2$$3$",["-",getMonthName(date.month),"-"]),align);
    	
    	if(debug){
    		for(var t=1;t<=12;t++) {dc.drawText(x,y,font,Lang.format("$1$$2$$3$",["-",getMonthName(t),"-"]),align);}
    	}
	}
	
	function setColors(dc){
		var bgColor = Application.getApp().getProperty("BackgroundColor");
        var fgColor = Application.getApp().getProperty("ForegroundColor");
        dc.setColor(Graphics.COLOR_TRANSPARENT, bgColor);
    	dc.clear();
    	dc.setColor(fgColor, Graphics.COLOR_TRANSPARENT);
	}
	
	
	function ifScreen(screenWidth,screenHeight,screenShape){
		return 
			screenWidth == System.getDeviceSettings().screenWidth &&
			screenHeight == System.getDeviceSettings().screenHeight &&	
			screenShape == System.getDeviceSettings().screenShape;
	}

	function canBurn(){
		var sys = System.getDeviceSettings();
        if(sys has :requiresBurnInProtection) {
        	return sys.requiresBurnInProtection;        	
        }
        return false;
	}
	
	function setColorsOled(dc,inLowPower){
		if(inLowPower){
			dc.setColor(Graphics.COLOR_BLACK,Graphics.COLOR_BLACK);
   			dc.clear();
   			dc.setColor(Graphics.COLOR_WHITE,Graphics.COLOR_TRANSPARENT);
		}else{
			setColors(dc);
		}
	}

}