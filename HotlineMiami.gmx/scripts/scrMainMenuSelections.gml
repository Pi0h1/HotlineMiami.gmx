if (select == 0 && level = 0) {
    sxeasy_stop();
    sxeasy_setVolume(0);
    sxeasy_play(working_directory + "\Static.mp3");
    room = nextlevel;
}

if (select == 0 && level == 1) {
    room = rmControls;
}
        
if (select == 1 && level == 0) {
    room = rmLevelSelect;
}
        
if (select == 2 && level == 0) {
    room = rmLeaderboards;
}
        
if (select == 4 && level == 0) {
    room = rmBandCredits;
}
