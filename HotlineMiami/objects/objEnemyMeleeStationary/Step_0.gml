scrMoveSolidOn();

if (reload > 0) reload--;
if (sprite_index == sprEWalkUnarmed) {
    // do nothing
} else global.factor += sign(alert);
if (path_index > 0) {
    if (image_speed < 0.2)
        image_speed = 0.2;
    if (alert == 0 && path_position == 1)
        path_end();
} else {
    if (image_speed < 1)
        image_speed = speed * 0.1;

}
angle = direction;
if (alert == 1) {
    if (place_meeting(x + lengthdir_x(8, angle), y + lengthdir_y(8, angle), objPlayer) or place_meeting(x, y, objPlayer)) {
        if (scrIsSearching(sprite_index))
            sprite_index = scrStopSearch(sprite_index);
        sprite_index = scrGetAttack(sprite_index);
        global.my_id = id;
        scrPlayerDieMelee();
        speed = 0;
    }
}

scrEMeleeStationaryStep();
scrMoveSolidOff();

