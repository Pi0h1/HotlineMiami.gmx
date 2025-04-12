draw_set_blend_mode(bm_subtract)
draw_surface(global.surf1,camera_get_view_x(view_camera[0])-16,camera_get_view_y(view_camera[0])-16)
draw_set_blend_mode(bm_normal)
texture_set_interpolation(false)
