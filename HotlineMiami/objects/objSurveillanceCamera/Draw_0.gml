if (wait > 0)
    wait--;
else {
    if (!on) {
        if (diradd > -30)
            diradd -= 0.2;
        else {
            wait = 120;
            on = 1;
        }
    }
    if (on) {
        if (diradd < 30)
            diradd += 0.2;
        else {
            wait = 120;
            on = 0;
        }
    }
}

draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
draw_sprite_ext(sprCamera, image_index, x + lengthdir_x(5, image_angle), y + lengthdir_y(5, image_angle), image_xscale, image_yscale, image_angle + diradd, image_blend, image_alpha);

