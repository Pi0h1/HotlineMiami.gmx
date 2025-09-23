image_speed = 0;
if (sprite_index == sprEnemyRise) {
    x += lengthdir_x(16, direction);
    y += lengthdir_y(16, direction);
    if (room == rmHighballer)
        my_id = instance_create(x, y, objEnemyMeleeStationary);
    else my_id = instance_create(x, y, type);
    my_id.alert = 1;
    my_id.checkreload = 15;
    if global.enemy = id global.enemy = my_id;
    scrMoveSolidOn();
    scrMoveSolidOff();
    instance_destroy();
}

