function scrXboxPlayerMouseHouse() {
	if (gettrigger_r(0) > 100 || gettrigger_l(0) > 100) {
	    if (!pressrtrig) {
	        pressrtrig = 1;
	        scrXboxPlayerHousePickup();
	    }
	} else pressrtrig = 0;



}
