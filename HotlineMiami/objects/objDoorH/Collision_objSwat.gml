if (solid)
    exit;
if (abs(swingspeed) > 3.5) {
    if (other.sprite_index == sprSwatStumble)
        exit;
    if (swinger == 1 || swinger == 0) {
        if (other.y < y) {
            other.vspeed = -1;
            other.angle = 270;
        }
        if (other.y >= y) {
            other.vspeed = 1;
            other.angle = 90;
        }
        other.hspeed = 0;
        other.image_index = 0;
        other.sprite_index = sprSwatStumble;
    }
    exit;
}
swinger = 2;
if (abs(swingspeed) < 2)
    audio_play_sound(sndDoorOpen, 0, false);
if (x > other.x && other.y < y) {
    swingspeed = -8;
    exit;
}
if (x > other.x and other.y > y) {
    swingspeed = 8;
    exit;
}
if (other.y < y + lengthdir_y(32, image_angle))
    swingspeed = -8;
else swingspeed = 8;

