if (solid)
    exit;

if (abs(swingspeed) > 3.5) {
    if (other.sprite_index == sprSwatStumble)
        exit;
    if (swinger == 1 || swinger == 0) {
        if (other.x < x) {
            other.hspeed = -1;
            other.angle = 0;
        }
        if (other.x >= x) {
            other.hspeed = 1;
            other.angle = 180;
        }
        other.vspeed = 0;
        other.image_index = 0;
        other.image_speed = 0.2;
        other.sprite_index = sprSwatStumble;
        audio_play_sound(sndDoorHit, 0, false);
    }
    exit;
}
swinger = 2;
if (abs(swingspeed) < 2)
    audio_play_sound(sndDoorOpen, 0, false);
if (y > other.y && other.x < x) {
    swingspeed = 8;
    exit;
}
if (y > other.y && other.x > x) {
    swingspeed = -8;
    exit;
}
if (other.x < x + lengthdir_x(32, image_angle + 270))
    swingspeed = 8;
else swingspeed = -8;

