function scrXboxWeaponUnlockStart() {
	if (global.newguns <= 0) {
	    fade = 1;
	    exit;
	}
	if (!on) {
	    global.newguns--;
	    global.newgun[current - 7] = 1;
	    on = 1;
	    scrCheckGuns();
	} else {
	    if (factor >= 1 && shine <= 0) {
	        global.newguns--;
	        shine = 1;
	        audio_play_sound(sndSplashFace, 0, false);
	        current++;
	        global.newgun[current - 7] = 1;
	        scrCheckGuns();
	    }
	}



}
