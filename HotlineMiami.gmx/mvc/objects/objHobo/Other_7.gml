update = 0;
if (sprite_index = sprHoboAttack) {
    sprite_index = sprHoboWalkBat;
    update = 1;
}
if (update) {
    image_speed = 0;
    image_yscale = -image_yscale;
}

