/// @description  scrMainMenuFadingDraw(c_left,c_top,c_right,c_bottom)
/// @param c_left
/// @param c_top
/// @param c_right
/// @param c_bottom
draw_set_blend_mode(bm_subtract);
draw_rectangle_color(__view_get( e__VW.XView, 0 ) - 10, __view_get( e__VW.YView, 0 ) - 10, __view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 ) + 10, __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 ) + 10, argument0, argument1, argument2, argument3, 0);
draw_set_blend_mode(bm_normal);
