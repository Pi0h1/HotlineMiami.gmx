if (keyboard_check_pressed(vk_f7)) {
	toggleLog = !toggleLog;
}
show_debug_log(toggleLog);
window_set_cursor(toggleLog ? cr_default : cr_none);