function scrDogSearch(argument0, argument1, argument2) {
	//scrSearch(goalx,goaly,precision)
	if (checkreload > 0)
	    checkreload--;
	else {
	    if (global.maskindex == 18)
	        dist = 100;
	    else dist = 220;
	    if (point_distance(x, y, argument0, argument1) < dist || path_index >= 0 || speed > 0) {
	        check = scrDogLook(argument0, argument1, argument2);
	    } else check = 1;
	    if (check == 0) {
	        if (alert == 0 && alertwait == -1)
	            alertwait = 15;
	        if (alert == 2 || alert = 3)
	            alert = 1;
	    }
	    if (check == 2) {
	        if (alert == 0)
	            alert = 2;
	    }
	    if (check > 0 && check < 2) {
	        if (alert > 0) {
	            alert = 3;
	            scrChase(path, argument0, argument1);
	        } else {
	            alert = 0;
	        }
	    }
	    checkreload = 30;
	}



}
