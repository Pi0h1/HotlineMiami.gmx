if (global.done) {
    my_id = instance_create(x, y, objEmpty);
    my_id.sprite_index = sprite_index;
    my_id.image_speed = 0;
    my_id.image_index = 1;
    instance_destroy();
}

