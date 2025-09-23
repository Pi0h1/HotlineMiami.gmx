draw_sprite_ext(sprite_index, image_index, x + 2, y + 3, image_xscale, image_yscale, image_angle, c_black, 0.5);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
if (!on)
    draw_sprite_ext(sprArrow, 0, x + 32, y + 60 + lengthdir_x(3, dir), 1, 1, 180, c_white, 1);
dir += 8;

