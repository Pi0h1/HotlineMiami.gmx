update = 0;
if (sprite_index == sprPInspectorDie) {
    my_id = instance_create(x, y, objDeadBody);
    my_id.direction = direction - 180;
    my_id.speed = 0.5;
    my_id.sprite_index = sprPInspectorDead;
    if (shotgunned)
        my_id.image_index = floor(random(2));
    else my_id.image_index = 3;
    my_id.image_angle = my_id.direction;
    instance_destroy();
    exit;
}

if (sprite_index == sprPInspectorSearch) {
    sprite_index = sprPInspectorWalk;
    image_speed = 0;
}

if (sprite_index == sprPInspectorAttack) {
    sprite_index = sprPInspectorWalk;
    image_speed = 0.2;
    update = 1;
}

