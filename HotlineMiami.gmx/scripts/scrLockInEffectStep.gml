var isInGameSession     = instance_exists(objEnemy) && (!instance_exists(objPlayerDead) && !instance_exists(objPlayerMouseHouse)) && !instance_exists(objEffectorHouse);
var lockInCondition     = (global.enemy != -1234 && isInGameSession);
var releaseCondition    = (isInGameSession);

if (lockInCondition) {
    c_cursor = c_red;
    bm_cursor = bm_normal;
     hasPlayedSFXRelease = false;
    if (!hasPlayedSFXLock) {
        audio_play_sound(sndLock,0,0);
        hasPlayedSFXLock = true;
    }
} else {
    c_cursor = c_white;
    bm_cursor = bm_add;
    hasPlayedSFXLock = false;
    if (!hasPlayedSFXRelease) {
        audio_play_sound(sndRelease,0,0);
        hasPlayedSFXRelease = true;
    }
}
