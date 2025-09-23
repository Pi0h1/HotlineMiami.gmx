surface_set_target(global.surf1);

draw_clear(make_color_hsv(155, 5 - random(5), 250 + random(5)));
draw_set_blend_mode(bm_subtract);
with (objLightNormal) {
    draw_circle_color(x, y, strength * (2 + random(0.1)), merge_color(c_black, color, 0.9 + random(0.1)), c_black, 0);
}
with (objBurningTrashcan) {
    draw_circle_color(x, y, strength * (2 + random(0.1)), merge_color(c_black, c_white, 0.9 + random(0.1)), c_black, 0);
}
with (objPlayer) {
    draw_circle_color(x, y, 32 + random(4), c_gray, c_black, 0);
}

draw_set_blend_mode(bm_normal);
surface_reset_target();

