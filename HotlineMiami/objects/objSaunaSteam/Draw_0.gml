draw_set_blend_mode(bm_add);
color2 = merge_color(c_gray, c_ltgray, 0.5 + lengthdir_x(0.5, dir));
dir += 3;
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, merge_color(c_black, color2, amount), 1);
draw_sprite_ext(sprite_index, image_index + 1, x, y, image_xscale, image_yscale, 0, merge_color(c_black, color2, 1 - amount), 1);
draw_set_blend_mode(bm_normal);
if (amount > 0)
    amount -= 0.01;
else {
    amount = 1;
    image_index++;
}

