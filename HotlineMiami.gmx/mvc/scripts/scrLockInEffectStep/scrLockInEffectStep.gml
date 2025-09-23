if (global.enemy != -1234) && !instance_exists(objPlayerDead) {
    c_cursor = c_red;
    bm_cursor = bm_normal;
    if (!hasPlayedSFX) {
        audio_play_sound(sndLock,0,0);
        hasPlayedSFX = true;
    }
} else {
    c_cursor = c_white;
    bm_cursor = bm_add;
    hasPlayedSFX = false;
}
