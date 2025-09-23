draw_set_blend_mode(bm_add);
draw_circle_color(x, y, r, merge_color(c_aqua, c_white, random(1)), c_black, 0);
draw_set_blend_mode(bm_normal);
if (r > 0)
    r -= 2;
else instance_destroy();

