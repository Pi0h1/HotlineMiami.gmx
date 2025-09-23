if (image_index < 49)
    image_index += 0.15;
else {
    my_id = instance_create(x, y, objDeadBody);
    my_id.image_angle = image_angle;
    my_id.sprite_index = sprAssassinDead;
    my_id.image_index = shot;
    my_id = instance_create(x, y, objPlayerMouse);
    my_id.maskon = global.maskon;
    my_id.maskindex = global.maskindex;
    global.dir = image_angle;
    with my_id move_outside_solid(global.dir - 180, 16);
    instance_destroy();
    exit;
}

