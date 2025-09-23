if (shake > 0)
    shake -= 0.5;
angle = direction;

if (light > 0)
    light--;
draw_set_blend_mode(bm_add);
draw_circle_color(x, y, 48 + random(6) + light, make_color_hsv(0, 0, 30), c_black, 0);
draw_set_blend_mode(bm_normal);
if (scrIsSearching(sprite_index)) {
    // do nothing
} else {
    draw_sprite_ext(sprPoliceLegs, image_index * 2, x + 1, y + 1, image_xscale, image_yscale, angle, c_black, 0.5);
    draw_sprite_ext(sprPoliceLegs, image_index * 2, x, y, image_xscale, image_yscale, angle, image_blend, image_alpha);
}
draw_sprite_ext(sprite_index, image_index, x + 1 - shake + random(shake * 0.5), y + 1 - shake + random(shake * 0.5), image_xscale, image_yscale, angle, c_black, 0.5);
draw_sprite_ext(sprite_index, image_index, x - shake + random(shake * 0.5), y - shake + random(shake * 0.5), image_xscale, image_yscale, angle, image_blend, image_alpha);
draw_set_color(c_white);

