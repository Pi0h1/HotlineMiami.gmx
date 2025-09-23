draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
draw_set_blend_mode(bm_add);
draw_sprite_ext(sprBarRegisterGlow, index, x, y, image_xscale, image_yscale, image_angle, merge_color(merge_color(c_fuchsia, c_aqua, 0.5 + lengthdir_x(0.5, dir)), c_white, random(0.25 + random(0.5))), image_alpha);
index += 0.2;
dir += 0.5;
draw_set_blend_mode(bm_normal);

