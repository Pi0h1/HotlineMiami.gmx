if (image_index < 27) {
    image_index += 0.25;
} else {
    instance_create(x, y, objPlayerMouse);
    instance_destroy();
}

if (image_index >= 20) {
    with (objSecretSewer) {
        if (open == 0) {
            open = 1;
            audio_play_sound(sndManhole, 0, false);
            my_id = instance_create(x, y, objSewerGrate);
            my_id.hspeed = -2.5;
        }
    }
}

