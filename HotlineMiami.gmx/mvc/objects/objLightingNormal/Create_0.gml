surface_free(global.surf1);
global.surf1 = surface_create(room_width, room_height);
surface_set_target(global.surf1);
draw_clear(c_white);
surface_reset_target();

