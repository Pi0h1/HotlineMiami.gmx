if (state < 2) {
    draw_sprite_ext(sprite_index, image_index, x + 1, y + 1, image_xscale, image_yscale, image_angle, c_black, 0.5);
    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
} else {
    draw_sprite_ext(sprAssassinSitLegs, 0, x + 1, y + 1, image_xscale, image_yscale, image_angle, c_black, 0.5);
    draw_sprite_ext(sprAssassinSitLegs, 0, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    draw_sprite_ext(sprAssassinUzi, 0, x + 1, y + 1, image_xscale, image_yscale, direction, c_black, 0.5);
    draw_sprite_ext(sprAssassinUzi, 0, x, y, image_xscale, image_yscale, direction, image_blend, image_alpha);
}
draw_sprite_ext(sprRatMask, 0, x, y, image_xscale, image_yscale, direction, image_blend, image_alpha);

