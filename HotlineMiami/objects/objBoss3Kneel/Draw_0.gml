if (image_index < 5)
    image_index += 0.2;
else {
    if (!instance_exists(objPhoneConversation))
        objPlayer.active = 1;
}
draw_sprite_ext(sprite_index, image_index, x + 1, y + 1, image_xscale, image_yscale, direction, c_black, 0.5);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, direction, image_blend, image_alpha);

