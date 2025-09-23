my_id = instance_create(x, y, objHobo);
my_id.angle = image_angle - 180;
my_id.state = -1;
my_id.sprite_index = sprHoboWalk;
with (my_id) {
    move_outside_solid(image_angle, 16);
}
instance_destroy();

