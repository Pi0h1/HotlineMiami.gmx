if (point_distance(x, y, objPlayer.x, objPlayer.y) < 24 && !seen) {
    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_black, 0.5);
    draw_sprite_ext(sprite_index, image_index, x, y - abs(lengthdir_x(1.5, dir)), image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    dir += 4;
} else {
    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    dir += 4;
}

