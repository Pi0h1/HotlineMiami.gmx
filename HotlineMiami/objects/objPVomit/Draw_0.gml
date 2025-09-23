draw_sprite_ext(sprite_index, image_index, x + 1, y + 1, image_xscale, image_yscale, image_angle, c_black, 0.5);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
if (image_index < 3)
    draw_sprite_ext(masksprite, 3 - image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);

