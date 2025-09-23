if (x < 0)
    hspeed = abs(hspeed);
if (x > room_width)
    hspeed = -abs(hspeed);
if (y < 0)
    vspeed = abs(vspeed);
if (y > room_height)
    vspeed = -abs(vspeed);
scrMoveSolidOn()

if (reload > 0)
    reload--;
if (sprite_index == sprPoliceWalkUnarmed) {
    // do nothing
} else global.factor += sign(alert);
if (path_index > 0) {
    if (image_speed < 1)
        image_speed = 0.2;
    if (alert == 0 && path_position == 1)
        path_end();
} else {
    if (image_speed < 1)
        image_speed = speed * 0.1;
    if (!place_free(x, y)) {
        tempdir = direction;
        i = 1;
        while ((!place_free(x + lengthdir_x(4 + i / 20, tempdir), y + lengthdir_y(4 + i / 20, tempdir))) && i < 100) {
            tempdir += 18;
            i++;
        }
        if (i < 100)
            move_outside_solid(tempdir, 4 + i / 20);
    }
}
scrPoliceMeleeStep();
scrMoveSolidOff();

angle = direction;
if (alert == 1) {
    if (place_meeting(x + lengthdir_x(8, angle), y + lengthdir_y(8, angle), objPlayer) || place_meeting(x, y, objPlayer)) {
        global.my_id = id;
        if (scrIsSearching(sprite_index))
            sprite_index = scrStopSearch(sprite_index);
        sprite_index = scrGetAttack(sprite_index);
        scrPlayerDieMelee();
    }
}

