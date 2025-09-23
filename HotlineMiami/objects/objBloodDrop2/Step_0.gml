if (speed > 0) {
    if (wait > 0) wait--;
    else {
        wait = 2;
        image_index += 2;
    }
    image_blend = make_color_hsv(0, 255, 255 - random(55));
}
if (speed < speedlimit) {
    if (speed > 0)
        image_index += 1;
    speed = 0;
    image_blend = c_red;
    addToSurface(global.surf3, 0);
}

