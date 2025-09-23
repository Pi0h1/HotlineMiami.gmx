function scrXboxSnapKill() {
	if (gettrigger_r() > 100) {
	    if (!pressrtrig) {
	        pressrtrig = 1;
	    }
	} else pressrtrig = 0;



}
