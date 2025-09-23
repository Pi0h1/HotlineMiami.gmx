event_inherited();

if (room == rmPhoneHomUpstairsBiker) {
    if (!instance_exists(objCEO) && active) {
        draw_sprite_ext(sprArrow, 0, x + 12, y - 20 + lengthdir_x(3, dir), 1, 1, 0, c_white, 1);
        dir += 3;
    }
}

