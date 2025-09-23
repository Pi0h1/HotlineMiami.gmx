if (!instance_exists(objPlayer))
    exit;
if (xlimit < 0) {
    if (objPlayer.x < x && !place_meeting(x, y, objPlayer))
        solid = 1;
    else solid = 0;
}
if (xlimit > 0) {
    if (objPlayer.x > x && !place_meeting(x, y, objPlayer))
        solid = 1;
    else solid = 0;
}

if (global.done)
    solid = 0;

