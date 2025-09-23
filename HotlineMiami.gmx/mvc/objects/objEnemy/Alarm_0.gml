if (room == rmTutorial)
    exit;
if (path_index > 0 || scrIsSearching(sprite_index)) {
    alarm[0] = 5;
    exit;
}
if (alert == 1) {
    alarm[0] = 5;
    exit;
}
alarm[0] = 60 + random(60);
angle = random(360);
speed = round(random(1));
image_speed = speed * 0.1;
direction = angle;
if (speed == 0)
    image_index = 0;

