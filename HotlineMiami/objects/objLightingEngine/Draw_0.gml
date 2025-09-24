draw_set_blend_mode(bm_subtract);
draw_surface(global.surf1, camera_get_view_x(view_camera[0]) - 16, camera_get_view_y(view_camera[0]) - 16);
draw_set_blend_mode(bm_normal);
texture_set_interpolation(false);

show_debug_message("surface width: " + string(surface_get_width(global.surf1)));
show_debug_message("surface height: " + string(surface_get_height(global.surf1)));

