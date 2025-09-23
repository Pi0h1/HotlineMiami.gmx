if (on == 0) {
    on = 1;
    if (!global.opensound)
        audio_play_sound(sndSubwayDoor, 0, false);
    global.opensound = 1;
}

