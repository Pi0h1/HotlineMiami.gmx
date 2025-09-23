if (sprite_index == last_sprite) {
    // do nothing
} else {
    scrUpdateMaskPos(sprite_index);
    last_sprite = sprite_index;
}
draw_sprite_ext(sprite_index, image_index, x + 1, y + 1, image_xscale, image_yscale, image_angle, c_black, 0.5);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);

if (sprite_index == sprPWalkLedge) {
    scrDrawMask(1);
}

if (sprite_index == sprPClimbLedge) {
    dir = 0;
    if (image_index >= 2)
        dir = -45;
    if (image_index >= 3)
        dir = -90;
    scrDrawMaskLedge(0);
}

