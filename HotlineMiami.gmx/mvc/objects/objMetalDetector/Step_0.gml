if (wait > 0) {
    wait--;
    if (wait == 0) {
        on = 0;
        global.test = 0;
        with (objMetalDetector) {
            if (on)
                global.test = 1
        }
        if (!global.test) {
            audio_stop_sound(sndAlarm);
            global.alarmsound = 0;
        }
    }
}
if (place_meeting(x, y, objPlayer)) {
    if (objPlayer.sprite_index == sprPWalkUnarmed || objPlayer.sprite_index == sprPWalkBat || objPlayer.sprite_index == sprPWalkPool || objPlayer.sprite_index == sprPWalkPoolBroke || objPlayer.sprite_index == sprPAttackThrow || objPlayer.sprite_index == sprPAttackPunch || objPlayer.sprite_index == sprPAttackBat || objPlayer.sprite_index == sprPAttackPool || objPlayer.sprite_index == sprPAttackPoolBroke || objPlayer.sprite_index == sprPWalkNightStick || objPlayer.sprite_index == sprPAttackNightStick) {
        // do nothing
    } else {
        if (objPlayer.sprite_index == sprPWalkThrow) {
            if (objPlayer.throwindex >= 1 && objPlayer.throwindex <= 3) {
                // do nothing
            } else {
                if (!on) {
                    if (!global.alarmsound) {
                        audio_play_sound(sndAlarm, 0, false);
                        global.alarmsound = 1;
                    }
                    on = 1;
                    scrHearPlayer();
                }
                wait = 180;
            }
        } else {
            if (!on) {
                if (!global.alarmsound) {
                    audio_play_sound(sndAlarm, 0, false);
                    global.alarmsound = 1;
                }
                on = 1;
                scrHearPlayer();
            }
            wait = 180;
        }
    }
}

