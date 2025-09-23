fade = 0;
amount = 0;
alarm[0] = 110;
scrSetPort();
global.mvol = 1;
scrLoadVol();;
if (file_exists(working_directory + "\\skip")) {
    global.currentsong = 0;
    sxeasy_init();
    sxeasy_play(working_directory + "\\HorseSteppin.mp3");
    room_goto(rmMenu);
} else {
    sxeasy_init();
    file = file_text_open_write(working_directory + "\\skip");
    file_text_close(file);
}

