surface_set_target(global.surf1);

draw_clear(make_color_hsv(155, 5 - random(5), 200 + random(5)));
draw_set_blend_mode(bm_subtract);
with (objLight) {
    draw_circle_color(x - camera_get_view_x(view_camera[0]) + 16, y - camera_get_view_y(view_camera[0]) + 16, radius * (1 + random(0.1)), merge_color(c_black, color, strength * (0.9 + random(0.1))), c_black, 0);
}
with (objPlayer) {
    draw_circle_color(x - camera_get_view_x(view_camera[0]) + 16, y - camera_get_view_y(view_camera[0]) + 16, 32 + random(4), c_gray, c_black, 0);
}




draw_set_blend_mode(bm_add);

i = 0;
repeat(30) {
    draw_circle_color(myx[i], myy[i], size[i] + random(0.5), c_white, c_black, 0);
    myx[i] += lengthdir_x(myspeed[i], mydir[i]);
    myy[i] += lengthdir_y(myspeed[i], mydir[i]);
    mydir[i] += diradd[i];
    if (round(random(30)) == 2)
        diradd[i] = -4 + random(8);
    if (myx[i] < -16)
        myx[i] += 432;
    if (myy[i] < -16)
        myy[i] += 288;
    if (myy[i] > 272)
        myy[i] -= 288;
    if (myx[i] > 416)
        myx[i] -= 432;
    i++;
}
draw_set_blend_mode(bm_normal);
surface_reset_target();

