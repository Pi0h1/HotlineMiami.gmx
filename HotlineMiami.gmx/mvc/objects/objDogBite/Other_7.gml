my_id = instance_create(x, y, objDogPatrol);
my_id.gotowall = 1;
my_id.image_angle = round(image_angle * 0.1) * 10;
with (my_id) {
    move_outside_solid(image_angle - 180, 8);
}
instance_destroy();

