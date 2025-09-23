if (speed <= 0) {
    other.ammo++;
    instance_destroy();
    audio_play_sound(sndPickupWeapon, 0, false);
}

