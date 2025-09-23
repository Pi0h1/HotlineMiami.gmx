function scrPolicePatrolStep() {
	angle = direction;
	if (speed > 0)
	    image_speed = speed * 0.1;
	if (sprite_index == sprEWalkUnarmed) {
	    scrGoGetWeapon();
	    alert = 0;
	} else {
	    if (alert == 0) {
	        if (instance_exists(objPlayer))
	            scrMeleeSearch(objPlayer.x, objPlayer.y, 4);
	        if (alertwait > -1) {
	            alertwait--;
	            if (alertwait == 0) {
	                path_end();
	                alert = 1;
	            }
	        }
	        if (scrIsSearching(sprite_index)) {
	            image_speed = 0.2;
	            speed = 0;
	        }
	        if (!returning) {
	            speed = 1;
	            direction = round(direction * 0.1) * 10;
	            scrPatrol();
	        } else {
	            returning = 0;
	            speed = 1;
	            direction = round(direction * 0.1) * 10;
	        }
	    }
	    if (path_index >= 0)
	        image_speed = path_speed * 0.1;
	    if (!instance_exists(objPlayer)) {
	        alert = 0;
	        scrMoveSolidOff();
	        exit;
	    }
	    if (alert < 2 && alert > 0) {
	        scrCharge(objPlayer.x, objPlayer.y, 10, 4);
	    }
	}

	if (alert == 2) {
	    scrChase(path, objPlayer.x, objPlayer.y);
	    alert = 3;
	}
	if (alert == 3) {
	    scrMeleeChaseSearch(objPlayer.x, objPlayer.y, 4);
	}
	scrMoveSolidOff();



}
