if (gettrigger_r() > 100 || gettrigger_l() > 100) {
    if (!instance_exists(objPlayerMouseHouse) || talked > 3 || instance_exists(objPhoneConversation) || !objPlayer.active)
        exit;
    if (place_meeting(x + lengthdir_x(32, 90), y + lengthdir_y(32, 90), objPlayer)) {
        objPlayer.image_index = 0;
        objPlayer.active = 0;
        scrGetMessage(talked);
        talked++;
    }
}
