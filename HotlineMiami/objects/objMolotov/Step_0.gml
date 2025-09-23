dist += speed;
if (!place_free(x, y) || speed <= 3 || dist > limit) {
    if (place_meeting(x, y, objVan))
        exit;
    x -= hspeed;
    y -= vspeed;
    instance_create(x, y, objBottleExplosion);
    instance_destroy();
    audio_play_sound(choose(sndGlass1, sndGlass2), 0, false);
    audio_play_sound(sndMolotov, 0, false);
}

