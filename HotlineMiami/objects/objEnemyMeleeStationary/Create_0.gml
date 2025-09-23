scrEMeleeStationaryInit();
image_speed = 0;
image_index = random(1000);
image_speed = 0;
energie = round(random(1));
direction = random(360);
my_path = path_add();
path_set_kind(my_path, 1);
path_set_precision(my_path, 2);
checkreload = floor(random(30));
ammo = 24;
alert = 0;
reload = 0;
light = 0;
start_x = x;
start_y = y;
weaponfind = 0;
lastsprite = sprite_index;

