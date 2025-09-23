function scrMCKill() {
	if (reload > 0)
	    exit;
	lastammo = ammo;

	global.executionx = x;
	global.executiony = y;
	release = 0;
	global.test = 0;
	global.drop = 1;

	with (objKnockedOut) {
	    image_xscale = 3;
	    image_yscale = 3;
	    if (place_meeting(x, y, objPlayer) && global.test == 0) {
	        global.test = 2;
	        global.ammo = objPlayer.ammo;
	        with (objPlayer)
	            instance_destroy();
	        my_id = instance_create(x, y, choose(objMCStompKill, objMCChopKill, objMCKnifeKill));
	        my_id.image_angle = angle;
	        my_id.ammo = global.ammo;

	        instance_destroy();

	    }
	    image_xscale = 1;
	    image_yscale = 1;
	}

	with (objKnockedOut) {
	    image_xscale = 1;
	    image_yscale = 1;
	}



}
