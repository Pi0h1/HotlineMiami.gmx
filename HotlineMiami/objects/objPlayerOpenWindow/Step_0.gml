if (image_index < 19) {
    image_index += 0.2;
} else {
    my_id = instance_create(x, y, objPWalkWindow);
    if (sprite_index == sprPClimbWindow) {
        my_id.sprite_index = sprPWalkLedge;
    } else my_id.sprite_index = sprPWalkWindow;
    instance_destroy();
}

