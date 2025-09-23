draw_set_blend_mode(bm_subtract);
draw_surface(global.surf1, __view_get( e__VW.XView, 0 ) - 16, __view_get( e__VW.YView, 0 ) - 16);
draw_set_blend_mode(bm_normal);
texture_set_interpolation(false);

