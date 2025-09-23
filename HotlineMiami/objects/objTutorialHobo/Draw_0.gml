draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
if (state == 3) {
    with (objWeapon) {
        if (image_index == 4)
            draw_sprite_ext(sprArrow, 0, x, y - 6 + lengthdir_x(3, global.dir * 8), 1, 1, 0, c_white, 1);
    }
}
if (state == 5) {
    with (objWeapon) {
        if (image_index == 1)
            draw_sprite_ext(sprArrow, 0, x, y - 6 + lengthdir_x(3, global.dir * 8), 1, 1, 0, c_white, 1);
    }
}
if (state == 6) {
    with (objEnemy) {
        draw_sprite_ext(sprArrow, 0, x, 208 + lengthdir_x(3, global.dir * 8), 1, 1, 0, c_white, 1);
    }
}

