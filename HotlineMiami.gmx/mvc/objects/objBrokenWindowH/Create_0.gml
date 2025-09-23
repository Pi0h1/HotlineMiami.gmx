mp_grid_add_instances(global.grid, id, 1);
i = 0;
repeat(16) {
    my_id = instance_create(x + i * 2, y + 1, objShard);
    my_id.direction = 90 - 10 + random(20);
    my_id.speed = random(3);
    i++;
}

