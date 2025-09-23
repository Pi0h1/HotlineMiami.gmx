if (on) {
    draw_set_blend_mode(bm_add);
    draw_line_width_color(x, y, x, __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 ) + 32, 3, merge_color(merge_color(c_red, c_white, 0.2 + lengthdir_x(0.2, dir - 180)), c_black, random(0.2)), merge_color(merge_color(c_red, c_white, 0.2 + lengthdir_x(0.2, dir)), c_black, random(0.2)));
    draw_set_blend_mode(bm_normal);
    if (__view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 ) + 32 > y)
        draw_line_width_color(x, y, x, __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 ) + 32, 1, merge_color(c_red, c_white, 0.3 + lengthdir_x(0.3, dir)), merge_color(c_red, c_white, 0.3 + lengthdir_x(0.3, dir - 180)));
    dir += 8;
}

