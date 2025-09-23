h += 0.5;
if (h > 255)
    h -= 255;
color = make_color_hsv(h, 255, 255);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
draw_sprite_ext(sprite_index, 1, x, y, image_xscale, image_yscale, image_angle, color, image_alpha);
draw_set_blend_mode(bm_add);
draw_sprite_ext(sprClosetGlow, 0, x, y, image_xscale, image_yscale, image_angle, color, image_alpha);
draw_set_blend_mode(bm_normal);

