if (floor(index * 0.5) == 0)
    light = sprDanceFloorLight0;
if (floor(index * 0.5) == 1)
    light = sprDanceFloorLight1;
if (floor(index * 0.5) == 2)
    light = sprDanceFloorLight2;
if (floor(index * 0.5) == 3)
    light = sprDanceFloorLight3;
if (index < 3.5)
    index += 0.5;
else index = 0;

draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
draw_sprite_ext(sprDanceFloorFrame, image_index, x, y, image_xscale, image_yscale, image_angle, merge_color(image_blend, c_white, 0.5 + lengthdir_x(0.5, sdir * 12)), image_alpha);
draw_set_blend_mode(bm_add);
draw_sprite_ext(light, image_index, x, y, image_xscale, image_yscale, image_angle, merge_color(c_black, merge_color(image_blend, merge_color(c_yellow, c_red, 0.25 + random(0.25)), random(1)), 0.5 + lengthdir_x(0.5, sdir * 30)), image_alpha);
draw_set_blend_mode(bm_normal);

