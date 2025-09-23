draw_sprite_ext(bottom, hurtindex, x + 1, y + 1, image_xscale, image_yscale, image_angle, c_black, 0.5);
draw_sprite_ext(bottom, hurtindex, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
draw_sprite_ext(sprite_index, image_index, x + 1, y + 1, image_xscale, image_yscale, image_angle, c_black, 0.5);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
if (hurtindex < targetindex)
    hurtindex += 0.25;
if (image_index > 0)
    image_index -= 0.5;

