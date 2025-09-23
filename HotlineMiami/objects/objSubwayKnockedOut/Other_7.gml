my_id = instance_create(x, y, objESubwayStatic);
my_id.angle = image_angle - 180;
my_id.alert = 1;
with (my_id) {
    move_outside_solid(angle, 16);
}
instance_destroy();

