fade = 0;
amount = 0;
alarm[0] = 110;
scrSetPort();
global.mvol = 1;
scrLoadVol();;

if (variable_global_exists("skip")) {
	if (global.skip) {
		global.currentsong = 0;
		sxeasy_init();
		sxeasy_play(working_directory + "\\HorseSteppin.mp3");
		room_goto(rmMenu);
	}

} else {
    sxeasy_init();
	global.skip = 1;
}

global.factor = 1;
global.done = 0;
global.loaded = 0;
global.tempSave = array_create(real(room_last) - 1, -1);
global.test = 0;