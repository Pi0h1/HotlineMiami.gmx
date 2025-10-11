if (keyboard_check_pressed(192)) {
	toggleLog = !toggleLog;
}
show_debug_log(toggleLog);
window_set_cursor(toggleLog ? cr_default : cr_none);

if (keyboard_check_pressed(vk_f5)) {
	checkpoint_save(working_directory + "\\tempsave.sav");
}

if (keyboard_check_pressed(vk_f7)) {
	checkpoint_load(working_directory + "\\tempsave.sav");
}

if (keyboard_check_pressed(ord("V"))) {
	with (objPlayer) {
		x = global.mousex;
		y = global.mousey;
	}
}

if (keyboard_check_pressed(vk_f8)) {
	toggleGridDraw = !toggleGridDraw;
}