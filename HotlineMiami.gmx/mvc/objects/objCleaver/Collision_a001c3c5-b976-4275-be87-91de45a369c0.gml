if (speed <= 0)
    exit;
if (y < room_height / 2)
    image_angle = 90;
else image_angle = 270;
move_contact_solid(image_angle, speed);
x += lengthdir_x(2, image_angle);
y += lengthdir_y(2, image_angle);
speed = 0;
global.shake = 2;
audio_play_sound(sndHitWall, 0, false);

