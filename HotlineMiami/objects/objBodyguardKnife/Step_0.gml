if (speed == 0)
    exit;
if (place_meeting(x, y, objPlayer)) {
    global.my_id = id;
    with (objPlayer) {
        my_id = instance_create(x, y, objPlayerDead);
        my_id.sprite_index = sprPBackNinjaKnife;
        my_id.image_angle = global.my_id.direction;
        my_id.direction = my_id.direction;
        my_id.speed = 1;
        audio_play_sound(sndCut1, 0, false);
        instance_destroy();
    }
    instance_destroy();
}

