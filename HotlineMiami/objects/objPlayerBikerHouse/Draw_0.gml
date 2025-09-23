if (persistent)
    exit;
if (sprite_index == sprMCPickUpPhone) {
    if (!instance_exists(objPhoneConversation)) {
        sprite_index = sprMCWalkNoHelmet;
        active = 1;
    } else {
        if (image_index < 3)
            image_index += 0.15;
    }
}
if (myspeed == 2.25) {
    legsprite = sprBikerLegsStairs;
} else legsprite = sprBikerLegs;
draw_set_blend_mode(bm_add);
draw_circle_color(x, y, 48 + random(6) + light, make_color_hsv(0, 0, 30 + light * 2), c_black, 0);
draw_set_blend_mode(bm_normal);
draw_sprite_ext(legsprite, legindex, x + 1, y + 1, image_xscale, image_yscale, legdir, c_black, 0.5);
draw_sprite_ext(sprite_index, image_index, x + 1, y + 1, image_xscale, image_yscale * left, dir, c_black, 0.5);
draw_sprite_ext(legsprite, legindex, x, y, image_xscale, image_yscale, legdir, image_blend, image_alpha);
if (aimon) {
    dir = point_direction(x, y, global.mousex, global.mousey);
    if (global.xbox)
        dir = scrXboxPlayerLook();
}
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale * left, dir, image_blend, image_alpha);
if (reload > 0)
    reload--;
if (light > 3)
    light -= 3;

