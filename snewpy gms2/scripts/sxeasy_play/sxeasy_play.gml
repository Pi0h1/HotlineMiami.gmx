function sxeasy_play(argument0) {
	if global.currentsong != "" {
		audio_stop_sound(global.currentsong);	
	}
    var lastsong = global.currentsong;
    var thissong = string_replace(argument0, "mp3", "ogg");

    if (!file_exists(working_directory + "\\restartmusic")) {
        if (is_real(global.currentsong) && global.currentsong != -1) { 
            audio_stop_sound(global.currentsong);
        }
    }
    global.currentsong = audio_create_stream(thissong);
    if (global.currentsong != -1) {
        audio_play_sound(global.currentsong, 100, true);
        audio_sound_gain(global.currentsong, global.mvol, 0);
    }

    if (!file_exists(working_directory + "\\restartmusic")) {
        if (is_real(lastsong) && lastsong != -1) {
            audio_destroy_stream(lastsong);
        }
    }
}
