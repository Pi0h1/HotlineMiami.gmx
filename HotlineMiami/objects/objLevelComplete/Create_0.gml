text = "CHAPTER CLEAR";
dir = 0;
dir2 = 0;
factor = 1;
if (global.barehanded && room == rmHouse2Upstairs)
    SteamSetAchievement("ACH_THESE_ARE_MY_GUNS");
if (room == rmSwatUpstairs) {
    sxeasy_setVolume(1);
    sxeasy_play(working_directory + "\\Release.mp3");
    file = file_text_open_write(working_directory + "\\restartmusic");
    file_text_writeln(file);
    file_text_close(file);
} else {
    audio_play_sound(sndComplete, 0, false);
    sxeasy_setVolume(1);
    sxeasy_play(working_directory + "\\Static.mp3");
}

DoSave = function() {
	scrSaveGeneric(global.tempSave[room]);	
	buffer_write(global.tempSave[room], buffer_f32, dir);
	buffer_write(global.tempSave[room], buffer_f32, dir2);
	buffer_write(global.tempSave[room], buffer_string, text);
	buffer_write(global.tempSave[room], buffer_f32, factor);
	buffer_write(global.tempSave[room], buffer_f32, start_x);
}
DoLoad = function() {
	scrLoadGeneric(global.tempSave[room]);	
	dir = buffer_read(global.tempSave[room], buffer_f32);
	dir2 = buffer_read(global.tempSave[room], buffer_f32);
	text = buffer_read(global.tempSave[room], buffer_string);
	factor = buffer_read(global.tempSave[room], buffer_f32);
	start_x = buffer_read(global.tempSave[room], buffer_f32);
}