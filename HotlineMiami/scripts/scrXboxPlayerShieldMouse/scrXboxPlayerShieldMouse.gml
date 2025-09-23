function scrXboxPlayerShieldMouse() {
	if (gettrigger_r() > 100) {
	    scrPlayerShieldShoot();
	} else pressrtrig = 0;

	if (gettrigger_l() > 100) {
	    if (!pressltrig) {
	        pressltrig = 1;
	        scrPlayerDropShield();
	    }
	} else pressltrig = 0;

	if (checkbutton(0, getid(8))) {
	    if (!pressrstick) {
	        pressrstick = 1;
	        scrXboxPlayerLockOn();
	    }
	} else pressrstick = 0;



}
