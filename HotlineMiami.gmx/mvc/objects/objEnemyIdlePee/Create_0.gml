image_speed = 0.15;
image_index = random(1000);
reload = floor(random(10));
alert = 0;
ammo = 0;
path = path_add();
with (instance_nearest(x, y, objToilet)) {
    image_index = 0;
}

