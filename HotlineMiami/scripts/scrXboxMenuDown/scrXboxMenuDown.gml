function scrXboxMenuDown() {
	if (fade == 1 || wait > 0)
	    exit;
	wait = 3;
	repeats = 0;
	if (level == 0) {
	    if (select < 3)
	        select++;
	    else select = 0;
	}
	if (level == 1) {
	    if (select < 4)
	        select++;
	    else select = 0;
	}
	if (level == 2) {
	    if (select < 1)
	        select++;
	    else select = 0;
	}
	if (level == 4) {
	    if (select < 3)
	        select++;
	    else select = 0;
	    if (select == 1 && global.surfaces)
	        select = 2;
	}



}
