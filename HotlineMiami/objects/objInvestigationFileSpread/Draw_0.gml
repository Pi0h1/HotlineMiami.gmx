if (place_meeting(x, y, objPlayer) && !seen) {
    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_black, 0.5);
    draw_sprite_ext(sprite_index, image_index, x, y - abs(lengthdir_x(1.5, dir)), image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    dir += 4;
} else {
    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    if (!seen)
        draw_sprite_ext(sprArrow, 0, x + 9 + lengthdir_x(3, dir), y, image_xscale, image_yscale, -90, image_blend, image_alpha);
    dir += 4;
}

