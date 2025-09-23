draw_set_blend_mode(bm_subtract);
draw_surface(global.surf1, __view_get( e__VW.XView, 0 ) - 16, __view_get( e__VW.YView, 0 ) - 16);
draw_set_blend_mode(bm_normal);
texture_set_interpolation(false);

show_debug_message("surface width: " + string(surface_get_width(global.surf1)));
show_debug_message("surface height: " + string(surface_get_height(global.surf1)));

