draw_sprite_ext(sprite_index, image_index, x + 1, y + 2, image_xscale, image_yscale, image_angle, c_black, 0.5);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
draw_set_blend_mode(bm_add);
draw_sprite_ext(sprJukeboxGlow, index, x, y, image_xscale, image_yscale, image_angle, merge_color(make_color_hsv(h, 255, 255), c_white, random(0.25 + random(0.5))), image_alpha);
index += 0.2;
h++;
draw_set_blend_mode(bm_normal);
draw_sprite_ext(sprJukeGlass, 0, x, y, image_xscale, image_yscale, image_angle, image_blend, 0.25);

