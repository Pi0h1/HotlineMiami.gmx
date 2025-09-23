if (!instance_exists(objPlayerMouseHouse) || talked)
    exit;
if (place_meeting(x + lengthdir_x(32, 90), y + lengthdir_y(32, 90), objPlayer)) {
    objPlayer.image_index = 0;
    objPlayer.active = 0;
    image_index = 1;
    scrGetMessage(0);
    talked = 1;
}

