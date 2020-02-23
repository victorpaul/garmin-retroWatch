using Toybox.Test;

class HelperTests {

	(:test)
	function success_get_month_name(logger){
		var uiH = new helper();
		
		Test.assertEqual("-",uiH.getMonthName(0));
		Test.assertEqual("Jan",uiH.getMonthName(1));
		Test.assertEqual("Feb",uiH.getMonthName(2));
		Test.assertEqual("Mar",uiH.getMonthName(3));
		Test.assertEqual("Apr",uiH.getMonthName(4));
		Test.assertEqual("May",uiH.getMonthName(5));
		Test.assertEqual("Jun",uiH.getMonthName(6));
		Test.assertEqual("Jul",uiH.getMonthName(7));
		Test.assertEqual("Aug",uiH.getMonthName(8));
		Test.assertEqual("Sep",uiH.getMonthName(9));
		Test.assertEqual("Oct",uiH.getMonthName(10));
		Test.assertEqual("Nov",uiH.getMonthName(11));
		Test.assertEqual("Dec",uiH.getMonthName(12));
		Test.assertEqual("-",uiH.getMonthName(13));
		
		return true;
	}
	
	(:test)
	function success_get_fonts_and_do_not_crash(logger){
		var uiH = new helper();
		
    	uiH.fontHuge245();    	
    	uiH.fontHuge45();
    	uiH.fontMedium();
    	uiH.fontSmallIcons();
    	uiH.fontIcons();
    	uiH.fontSmall();
    	return true;
	}

	(:test)
	function success_draw_bluetooth_options(logger){
		var uiH = new helper();
		var dc = new mockDC(logger);
		
		uiH.drawBluetoothConnectionSmall(dc,0,0);
		uiH.drawBluetoothConnection(dc,0,0);
		
		uiH.drawBluetoothConnection_(dc,10,10,uiH.fontIcons(),false);
		uiH.drawBluetoothConnection_(dc,10,10,uiH.fontIcons(),true);
		uiH.drawBluetoothConnection_(dc,10,10,uiH.fontIcons(),2);
		return true;	
	}
	
	(:test)
	function success_get_days_of_week(logger){
		var uiH = new helper();
		
		Test.assertEqual("-",uiH.getWeekdayName(0));
		Test.assertEqual("sun",uiH.getWeekdayName(1));
		Test.assertEqual("mon",uiH.getWeekdayName(2));
		Test.assertEqual("tue",uiH.getWeekdayName(3));
		Test.assertEqual("wed",uiH.getWeekdayName(4));
		Test.assertEqual("thu",uiH.getWeekdayName(5));
		Test.assertEqual("fri",uiH.getWeekdayName(6));
		Test.assertEqual("sat",uiH.getWeekdayName(7));
		Test.assertEqual("-",uiH.getWeekdayName(8));
				
		return true;
	}
	
	(:test)
	function success_get_analog_position(logger){
		var uiH = new helper();
		
		for(var m=0;m<60;m++){
			var xy = uiH.getAnalogClockPosition(60,m,100,100);
			Test.assertEqual(true,xy[0]!=0 || xy[1]!=0);
		}	
		for(var h=0;h<24;h++){
			var xy = uiH.getAnalogClockPosition(24,h,100,100);
			Test.assertEqual(true,xy[0]!=0 || xy[1]!=0);
		}
		
		return true;
	}
	
	
	

}	