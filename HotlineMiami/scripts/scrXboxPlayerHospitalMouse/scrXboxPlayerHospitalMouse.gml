function scrXboxPlayerHospitalMouse() {
	if (gettrigger_r(0) > 100 || gettrigger_l(0) > 100) {
	    if (!pressrtrig) {
	        pressrtrig = 1;
	        scrXboxPlayerHospitalPickup();
	    }
	} else pressrtrig = 0;



}
