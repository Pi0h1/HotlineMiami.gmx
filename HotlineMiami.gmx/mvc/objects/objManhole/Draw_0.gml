draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
if (!enter) {
    draw_sprite_ext(sprArrow, 0, x + 100 + lengthdir_x(3, dir), y + 77, image_xscale, image_yscale, 270, image_blend, image_alpha);
    dir += 4;
}

