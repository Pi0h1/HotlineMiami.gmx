my_id = instance_create(x, y, objSwat);
my_id.angle = round((angle - 180) * (1 / 90)) * 90;
my_id.alert = 1;
with (my_id) {
    move_outside_solid(angle, 16);
}
instance_destroy();

