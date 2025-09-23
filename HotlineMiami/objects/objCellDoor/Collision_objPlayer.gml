if (solid)
    exit;
swinger = 1;
if (abs(swingspeed) > 3.5)
    exit;
if (abs(swingspeed) < 2)
    audio_play_sound(sndDoorOpen, 0, false);
if (x > other.x and other.y < y) {
    swingspeed = -7;
    exit;
}
if (x > other.x && other.y > y) {
    swingspeed = 7;
    exit;
}
if (other.y < y + lengthdir_y(32, image_angle))
    swingspeed = -7;
else swingspeed = 7;

