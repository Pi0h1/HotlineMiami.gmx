if (image_index > 11) {
    if (!ripped) {
        ripped = true;
        audio_play_sound(sndBox, 0, false);
    }
}
draw_sprite_ext(sprite_index, image_index, x + 1, y + 1, image_xscale, image_yscale, image_angle, c_black, 0.5);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);

