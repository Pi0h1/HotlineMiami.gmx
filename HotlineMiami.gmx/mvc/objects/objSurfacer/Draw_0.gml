if (global.surfaces) {
    if (surface_exists(global.surf3) && surf3)
        draw_surface_ext(global.surf3, 0, 0, (1 / 3), (1 / 3), 0, c_white, 1);
    if (surface_exists(global.surf2) && surf2)
        draw_surface_ext(global.surf2, 0, 0, (1 / 3), (1 / 3), 0, c_white, 1);
}

