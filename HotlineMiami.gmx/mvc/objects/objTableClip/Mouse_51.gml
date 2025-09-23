if (seen)
    exit;
if (place_meeting(x + lengthdir_x(12, objPlayer.dir - 180), y + lengthdir_y(12, objPlayer.dir - 180), objPlayer)) {
    scrGetMessage(2);
    seen = 1;
}

