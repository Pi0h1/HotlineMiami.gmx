if (!instance_exists(objPlayerMouseHouse) || talked > 3 || instance_exists(objPhoneConversation) || !objPlayer.active)
    exit;
if (place_meeting(x + lengthdir_x(32, 90), y + lengthdir_y(32, 90), objPlayer)) {
    objPlayer.image_index = 0;
    objPlayer.active = 0;
    image_index = 1;
    scrGetMessage(talked);
    talked++;
}

