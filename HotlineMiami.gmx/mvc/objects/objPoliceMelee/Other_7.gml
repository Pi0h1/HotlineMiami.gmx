update = 0;
if (sprite_index == sprPoliceAttackNightStick) {
    sprite_index = sprPoliceWalkNightStick;
    update = 1;
}
if (update) {
    image_speed = 0;
    image_yscale = -image_yscale;
}

if (scrIsSearching(sprite_index)) {
    sprite_index = scrStopSearch(sprite_index);
    image_speed = 0;
}

