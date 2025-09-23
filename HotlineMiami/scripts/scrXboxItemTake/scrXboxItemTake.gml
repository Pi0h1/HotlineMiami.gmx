function scrXboxItemTake() {
	if (gettrigger_r() > 100 || gettrigger_l() > 100) {
	    if (!instance_exists(objPlayer) || !on)
	        exit;
	    if (place_meeting(x - lengthdir_x(12, objPlayer.dir), y - lengthdir_y(12, objPlayer.dir), objPlayer)) {
	        instance_destroy();
	        audio_play_sound(sndPickupWeapon, 0, false);
	    }
	}



}
