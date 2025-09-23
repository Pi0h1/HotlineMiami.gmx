if (place_meeting(x, y, objPlayer)) {
    instance_destroy();
    global.locked = 0;
    audio_play_sound(sndPickupWeapon, 0, false);
    with (objPlayerHospital)
        alarm[1] = 1;
}

