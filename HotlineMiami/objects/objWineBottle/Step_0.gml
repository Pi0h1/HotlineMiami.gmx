image_angle += speed * diradd * 10;
if (on) {
    if (image_index < 3)
        image_index += 0.25;
}
image_blend = merge_color(c_ltgray, c_white, speed * 0.5);

