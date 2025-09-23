global.factor = 1;
if (testsurface) {
    scrSurfaceTiles();
    testsurface = 0;
}
if (!surface_exists(global.surf2)) {
    global.surf2 = surface_create(room_width * 3, room_height * 3);
    if (surface_exists(global.surf2)) {
        surface_set_target(global.surf2);
        draw_clear_alpha(make_color_hsv(0, 0, 2), 0);
        surface_reset_target();
    }
}
if (!surface_exists(global.surf3)) {
    global.surf3 = surface_create(room_width * 3, room_height * 3);
    scrSurfaceTiles();
}
if (check >= 4) {
    tile_layer_show(1000);
    tile_layer_show(1002);
    tile_layer_show(1000000);
}

