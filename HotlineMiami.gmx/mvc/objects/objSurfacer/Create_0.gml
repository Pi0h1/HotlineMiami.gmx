if (surface_exists(global.surf2)) {
    surface_free(global.surf2);
    global.surf2 = surface_create(room_width * 3, room_height * 3);
}
if (surface_exists(global.surf3)) {
    surface_free(global.surf3);
    global.surf3 = surface_create(room_width * 3, room_height * 3);
}
if (surface_exists(global.surf2)) {
    surface_set_target(global.surf2);
    draw_clear_alpha(make_color_hsv(0, 0, 2), 0);
    surface_alpha();
    surface_reset_target();
}
if (surface_exists(global.surf3)) {
    surface_set_target(global.surf3);
    draw_clear_alpha(make_color_hsv(0, 0, 2), 0);
    surface_alpha();
    surface_reset_target();
}
save = 0;
testsurface = 0;
surf2 = 1;
surf3 = 1;
check = 0;

