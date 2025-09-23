text = "CHAPTER CLEAR";
dir = 0;
dir2 = 0;
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

