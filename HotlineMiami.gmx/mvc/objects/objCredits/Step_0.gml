if (global.xbox) {
    if (checkbutton(0, getid(5)) || checkbutton(0, getid(6))) {
        if (!presstart) {
            presstart = 1;
            scrXboxCreditsStart();
        }
    } else presstart = 0;
}

if (!surface_exists(global.surf1)) {
    global.surf1 = surface_create(room_width, room_height);
    surface_set_target(global.surf1);
    draw_clear_alpha(c_black, 0);
    surface_reset_target();
}
if (!surface_exists(global.surf2)) {
    global.surf2 = surface_create(room_width * 3, room_height * 3);
    surface_set_target(global.surf2);
    draw_clear_alpha(c_black, 0);
    surface_reset_target();
}
if (!surface_exists(global.surf3)) {
    global.surf3 = surface_create(room_width * 3, room_height * 3);
    surface_set_target(global.surf3);
    draw_clear_alpha(c_black, 0);
    surface_reset_target();
}



surface_set_target(global.surf1);
draw_clear_alpha(c_black, 0);
color1 = merge_color(c_yellow, c_orange, 0.5 + lengthdir_x(0.5, dir));
color2 = merge_color(c_lime, c_aqua, 0.5 + lengthdir_x(0.5, dir * 1.24));
dir += 2;
if (!fade) {
    if (creditalpha < 1)
        creditalpha += 0.01;
    if (topicalpha < 1)
        topicalpha += 0.01;
}
if (fade) {
    if (topicalpha > 0 && topicfade == 1)
        topicalpha -= 0.01
    if (creditalpha > 0)
        creditalpha -= 0.01;
    else {
        if (current < 15) {
            current++;
            fade = 0;
            topicfade = 0;
        }
    }
}

if (current <= 15) {
    draw_set_halign(fa_center);
    draw_set_valign(fa_top);
    draw_set_font(fntTopic);
    draw_set_alpha(topicalpha);
    draw_set_color(color1);
    draw_text(room_width / 2 + 2, room_height * 0.3 + 2 + 12, string_hash_to_newline(topic[current]));
    draw_set_color(color2);
    draw_text(room_width / 2, room_height * 0.3 + 12, string_hash_to_newline(topic[current]));
    draw_set_font(fntCredit);
    draw_set_alpha(creditalpha);
    i = 0;
    repeat(12) {
        draw_set_color(merge_color(merge_color(c_teal, c_aqua, 0.5 + lengthdir_x(0.5, dir)), merge_color(c_fuchsia, c_white, 0.5 + lengthdir_x(0.5, dir * 1.72)), i * (1 / 12)));
        if (frac(i * 0.5) > 0)
            addx = (1 - creditalpha) * (60 + i * 4);
        else addx = -(1 - creditalpha) * (60 + i * 4);
        draw_text(room_width / 2 + 6 - i + addx, room_height * 0.4 + 6 - i + 12, string_hash_to_newline(credit[current]));
        i++;
    }
    draw_set_alpha(1)
}
if (rollcredits) {
    d3d_set_projection_ortho(0, 0, 399, 255, 0);
    draw_set_color(color1);
    draw_set_font(fntCreditList);
    draw_text(room_width / 2 + 1, room_height - floor(credit_y) + 1, string_hash_to_newline(creditlist));
    draw_set_color(color2);
    draw_text(room_width / 2, room_height - floor(credit_y), string_hash_to_newline(creditlist));
}
surface_reset_target();

surface_set_target(global.surf3);
draw_surface_ext(global.surf2, 0, 0, 1, 1, 0, c_white, 0.998);
surface_reset_target();
surface_set_target(global.surf2);
draw_clear_alpha(c_black, 0.1);
texture_set_interpolation(true);
with (objSpread)
    draw_sprite_ext(sprite_index, image_index, x * 3, y * 3, image_xscale * 3, image_yscale * 3, image_angle, merge_color(c_white, c_yellow, random(1)), image_alpha);
draw_set_blend_mode(bm_add);
draw_surface_ext(global.surf3, -1200 * 0.01, -768 * 0.01, 1.02, 1.02, 0, c_white, 1);
texture_set_interpolation(false);
draw_set_blend_mode(bm_normal);
surface_reset_target();

