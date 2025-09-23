if (instance_exists(objPlayerMouse) || instance_exists(objPlayerMouseHouse)) {
    if (place_meeting(x, y, objPlayer) && image_index == 0) {
        objPlayer.sprite_index = sprPWalkClub;
        objPlayer.reload = 10;
        image_index = 1;
        audio_play_sound(sndPickupWeapon, 0, false);
    }
}

