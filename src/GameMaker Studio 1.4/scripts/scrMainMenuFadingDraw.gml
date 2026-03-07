/// scrMainMenuFadingDraw(c_left,c_top,c_right,c_bottom)
draw_set_blend_mode(bm_subtract);
draw_rectangle_color(view_xview[0] - 10, view_yview[0] - 10, view_xview[0] + view_wview[0] + 10, view_yview[0] + view_hview[0] + 10, argument0, argument1, argument2, argument3, 0);
draw_set_blend_mode(bm_normal);
