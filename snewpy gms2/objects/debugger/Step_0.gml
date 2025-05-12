if keyboard_check_pressed(ord("H")) {
	sxeasy_stop(global.currentsong);
}

if keyboard_check_pressed(ord("J")) {
	scrInitScore()
	global.factor = 1
	room_goto(rmNew11);
}

if (!variable_global_exists("factor")) {
	global.factor = 1;
}