instance_create(other.x, other.y, objGlassPanelHBroken);
with (other) {
    i = 0;
    repeat(16) {
        my_id = instance_create(x + i * 2, y + 2, objShard);
        my_id.direction = 260 + random(20);
        my_id.speed = 1 + random(3);
        i++;
    }
    audio_play_sound(choose(sndGlass1, sndGlass2), 0, false);
    instance_destroy();
}

