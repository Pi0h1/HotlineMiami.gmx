if surface_exists(global.surf1) {
    draw_surface_ext(global.surf1, -1, 0, 1, 1, 0, c_black, 1)
    draw_surface_ext(global.surf1, 0, 1, 1, 1, 0, c_black, 1)
    draw_surface_ext(global.surf1, 0, -1, 1, 1, 0, c_black, 1)
    draw_surface_ext(global.surf1, 1, 0, 1, 1, 0, c_black, 1)
    draw_surface_ext(global.surf1, 2, 2, 1, 1, 0, c_black, 0.5)
    draw_surface_ext(global.surf1, 0, 0, 1, 1, 0, c_white, 1)
} else {
    var txtErrorMessage = "YOUR SYSTEM IS#OUT OF VIDEO MEMORY#PLEASE RESTART THE GAME!";
    draw_set_font(fntScore);
    draw_set_valign(fa_top);
    draw_set_halign(fa_center);
    draw_set_color(c_black);
    draw_text(x - 1, y, txtErrorMessage);
    draw_text(x + 1, y, txtErrorMessage);
    draw_text(x, y + 1, txtErrorMessage);
    draw_text(x, y - 1, txtErrorMessage);
    draw_set_color(c_white)
    draw_text(x, y, txtErrorMessage);
}
