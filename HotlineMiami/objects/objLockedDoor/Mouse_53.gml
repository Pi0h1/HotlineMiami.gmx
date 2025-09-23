if (solid) {
    if (place_meeting(x - 8, y, objPlayer)) {
        if (objPlayer.sprite_index == sprPWalkHospital) {
            if (!global.locked) {
                objPlayer.x = x - 16;
                objPlayer.y = y + 16;
                audio_play_sound(sndKeycard, 0, false);
                objPlayer.sprite_index = sprPKeyLockOpen;
                objPlayer.image_index = 0;
                objPlayer.active = 0;
                objPlayer.dir = 0;
                solid = 0;
            }
        }
    }
}

