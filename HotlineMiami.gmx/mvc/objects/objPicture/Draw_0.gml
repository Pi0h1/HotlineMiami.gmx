draw_sprite_ext(sprite_index, image_index, x, y + add_y, 1, 1, image_angle, image_blend, image_alpha);
if (objEffector.fade) {
    add_y -= 1;
    objEffector.amount += 8;
}

