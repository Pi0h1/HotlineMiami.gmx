d3d_set_projection_ortho(0, 0, __view_get( e__VW.WPort, 0 ), __view_get( e__VW.HPort, 0 ), 0);
dir += 1 + dizziness * 2;

h1 += (-10 + random(20)) * dizziness;
h2 += (-10 + random(20)) * dizziness;
myx1 += (dizziness - random(dizziness * 2)) * 2;
myx2 += (dizziness - random(dizziness * 2)) * 2;
myy1 += (dizziness - random(dizziness * 2)) * 2;
myy2 += (dizziness - random(dizziness * 2)) * 2;
if (dizziness > 0.1)
    dizziness -= 0.005;
if (h1 > 255)
    h1 -= 255;
if (h2 > 255)
    h2 -= 255;
if (h1 < 0)
    h1 += 255;
if (h2 < 0)
    h2 += 255;
draw_set_blend_mode(bm_add);
draw_circle_color(__view_get( e__VW.WPort, 0 ) / 2, __view_get( e__VW.HPort, 0 ) / 2, __view_get( e__VW.WPort, 0 ) * 0.75, c_black, make_color_hsv(0, 0, 255 * (dizziness * (1 / 2))), 0);

draw_set_blend_mode(bm_add);
noiseindex += 0.25;
d3d_set_projection_ortho(0, 0, __view_get( e__VW.WView, 0 ), __view_get( e__VW.HView, 0 ), 0);
draw_sprite_ext(sprNoise, noiseindex, 0, 0, 1, 1, 0, merge_color(c_black, c_ltgray, dizziness * 0.5), 1);
draw_set_blend_mode(bm_normal);
with (objEffectorHospital) {
    if (blackx < 15)
        blackx += 1;
    global.dir++;

    if (instance_exists(objPhoneConversation)) {
        index = objPhoneConversation.index;
        if (blackx < 45)
            blackx += 2.5;
        if (blackx > 15) {
            if (phonex < 180)
                phonex += 10;
        }

        phonecolor1 = merge_color(c_orange, c_lime, 0.5 + lengthdir_x(0.25, global.dir * 2));
        phonecolor2 = merge_color(c_maroon, c_navy, 0.5 + lengthdir_x(0.25, global.dir * 2));
        if (instance_exists(objLightingEngine)) {
            with (objLight) {
                if (targetstrength) {
                    objEffector.phonecolor1 = color;
                    objEffector.phonecolor2 = c_black;
                }
            }
        }

        draw_triangle_color(__view_get( e__VW.WView, 0 ) - phonex, 0, __view_get( e__VW.WView, 0 ), 0, __view_get( e__VW.WView, 0 ), __view_get( e__VW.HView, 0 ), phonecolor1, phonecolor1, phonecolor2, 0);
        draw_triangle_color(__view_get( e__VW.WView, 0 ) - phonex, 0, __view_get( e__VW.WView, 0 ) - phonex + 70, __view_get( e__VW.HView, 0 ), __view_get( e__VW.WView, 0 ), __view_get( e__VW.HView, 0 ), phonecolor1, phonecolor2, phonecolor2, 0);
        draw_sprite_ext(sprPhoneLine, 0, __view_get( e__VW.WView, 0 ) - phonex, 0, 1, 2, 15, c_white, 1);
        draw_set_color(c_black);
        draw_rectangle(0, 0, __view_get( e__VW.WView, 0 ), blackx, 0);
        draw_rectangle(0, __view_get( e__VW.HView, 0 ), __view_get( e__VW.WView, 0 ), __view_get( e__VW.HView, 0 ) - blackx * 1.5, 0);
        draw_sprite_ext(sprite, index, __view_get( e__VW.WView, 0 ) - phonex + 128 + 2, __view_get( e__VW.HView, 0 ) / 2 + 3, image_xscale, image_yscale, lengthdir_x(4, global.dir * 1.67), c_black, 0.5);
        draw_sprite_ext(sprite, index, __view_get( e__VW.WView, 0 ) - phonex + 128, __view_get( e__VW.HView, 0 ) / 2, image_xscale, image_yscale, lengthdir_x(4, global.dir * 1.67), c_white, 1);
        if (blackx == 45) {
            textcolor1 = merge_color(merge_color(c_maroon, c_teal, 0.5 + lengthdir_x(0.5, global.dir)), c_black, objPhoneConversation.reload * 0.1);
            textcolor2 = merge_color(merge_color(c_white, c_yellow, 0.25 - lengthdir_x(0.25, global.dir)), c_black, objPhoneConversation.reload * 0.1);
            draw_set_color(textcolor1);
            draw_set_halign(fa_left);
            draw_set_valign(fa_top);
            draw_set_font(fntScore);
            draw_text(17, __view_get( e__VW.HView, 0 ) - 57, string_hash_to_newline(string_upper(objPhoneConversation.line1[objPhoneConversation.current])));
            draw_text(17, __view_get( e__VW.HView, 0 ) - 39, string_hash_to_newline(string_upper(objPhoneConversation.line2[objPhoneConversation.current])));
            draw_set_color(textcolor2);
            draw_text(15.5 - lengthdir_x(0.5, global.dir * 4), __view_get( e__VW.HView, 0 ) - 58.5 - lengthdir_x(0.5, global.dir * 4), string_hash_to_newline(string_upper(objPhoneConversation.line1[objPhoneConversation.current])));
            draw_text(15.5 - lengthdir_x(0.5, global.dir * 4), __view_get( e__VW.HView, 0 ) - 40.5 - lengthdir_x(0.5, global.dir * 4), string_hash_to_newline(string_upper(objPhoneConversation.line2[objPhoneConversation.current])));
        }
    } else {
        if (blackx > 0) {
            if (phonex > 0)
                phonex -= 10
            if (phonex > 40) {
                if (blackx > 15)
                    blackx -= 2.5;
            }

            if (phonex > 0) {
                phonecolor1 = merge_color(c_orange, c_lime, 0.5 + lengthdir_x(0.25, global.dir * 2));
                phonecolor2 = merge_color(c_maroon, c_navy, 0.5 + lengthdir_x(0.25, global.dir * 2));
                if (instance_exists(objLightingEngine)) {
                    with (objLight) {
                        if (targetstrength) {
                            objEffector.phonecolor1 = color;
                            objEffector.phonecolor2 = c_black;
                        }
                    }
                }
                draw_triangle_color(__view_get( e__VW.WView, 0 ) - phonex, 0, __view_get( e__VW.WView, 0 ), 0, __view_get( e__VW.WView, 0 ), __view_get( e__VW.HView, 0 ), phonecolor1, phonecolor1, phonecolor2, 0);
                draw_triangle_color(__view_get( e__VW.WView, 0 ) - phonex, 0, __view_get( e__VW.WView, 0 ) - phonex + 70, __view_get( e__VW.HView, 0 ), __view_get( e__VW.WView, 0 ), __view_get( e__VW.HView, 0 ), phonecolor1, phonecolor2, phonecolor2, 0);
                draw_sprite_ext(sprPhoneLine, 0, __view_get( e__VW.WView, 0 ) - phonex, 0, 1, 2, 15, c_white, 1);
            }
            draw_set_color(c_black);
            draw_rectangle(0, 0, __view_get( e__VW.WView, 0 ), blackx, 0);
            draw_rectangle(0, __view_get( e__VW.HView, 0 ), __view_get( e__VW.WView, 0 ), __view_get( e__VW.HView, 0 ) - blackx * 1.5, 0);
            if (phonex > 0) {
                draw_sprite_ext(sprite, index, __view_get( e__VW.WView, 0 ) - phonex + 128 + 2, __view_get( e__VW.HView, 0 ) / 2 + 3, image_xscale, image_yscale, lengthdir_x(4, global.dir * 1.67), c_black, 0.5);
                draw_sprite_ext(sprite, index, __view_get( e__VW.WView, 0 ) - phonex + 128, __view_get( e__VW.HView, 0 ) / 2, image_xscale, image_yscale, lengthdir_x(4, global.dir * 1.67), c_white, 1);
            }
        }
    }


    if (!fade) {
        if (amount < 180) {
            amount += 5 - start * 4;
            color1 = merge_color(c_black, merge_color(c_aqua, c_white, 0.5 + lengthdir_x(0.5, amount)), 0.5 + lengthdir_x(0.5, amount));
            if (amount > 90)
                color2 = merge_color(c_black, merge_color(c_fuchsia, c_white, abs(lengthdir_y(1, amount))), abs(lengthdir_y(1, amount)));
            else color2 = c_white;
            draw_set_blend_mode(bm_subtract);
            draw_rectangle_color(-10, -10, __view_get( e__VW.WView, 0 ) + 10, __view_get( e__VW.HView, 0 ) + 10, color1, color2, color2, color1, 0);
            draw_set_blend_mode(bm_normal);
        } else {
            start = 0;
            show_date = 0;
        }
    }

    if (fade) {
        if (amount > 0) {
            amount -= 10;
            if (restart || newsong) {
                sxeasy_setVolume(amount * (1 / 180));
            }
            color1 = merge_color(c_black, merge_color(c_aqua, c_white, 0.5 + lengthdir_x(0.5, amount)), 0.5 + lengthdir_x(0.5, amount));
            if (amount > 90)
                color2 = merge_color(c_black, merge_color(c_fuchsia, c_white, abs(lengthdir_y(1, amount))), abs(lengthdir_y(1, amount)));
            else color2 = c_white;
            draw_set_blend_mode(bm_subtract);
            draw_rectangle_color(-10, -10, __view_get( e__VW.WView, 0 ) + 10, __view_get( e__VW.HView, 0 ) + 10, color2, color1, color1, color2, 0);
            draw_set_blend_mode(bm_normal);
        } else {
            fade = 0;
            if (restart) {
                sxeasy_stop(1);
                sxeasy_setVolume(0);
                game_restart();
            } else {
                if (next) {
                    if (newsong) {
                        sxeasy_stop(1);
                        if (room = rmDream1)
                            sxeasy_setVolume(0);
                        sxeasy_play(song);
                    }
                    room = nextroom;
                } else {
                    game_load(working_directory + "\\tempsave.sav");
                }
            }
        }
    }
    coldir++;
    if (show_date) {
        text = "July 21st, 1989#Miami - Florida";
        i = 0;
        draw_set_alpha(0.5 + lengthdir_x(0.5, amount));
        draw_set_color(c_gray);
        draw_set_font(fntDate);
        draw_set_halign(fa_center);
        draw_set_valign(fa_center);
        draw_text(__view_get( e__VW.WView, 0 ) / 2 + 1, __view_get( e__VW.HView, 0 ) / 2 + 1, string_hash_to_newline(text));
        draw_set_color(c_white);
        draw_text(__view_get( e__VW.WView, 0 ) / 2, __view_get( e__VW.HView, 0 ) / 2, string_hash_to_newline(text));
        draw_set_alpha(1);
    }

    drawVignette();
}

screen_refresh();
if (round(random(100)) == 2)
    myx1 = -dizziness * 20 + random(dizziness * 40);
if (round(random(100)) == 2)
    myx2 = -dizziness * 20 + random(dizziness * 40);
if (round(random(100)) == 2)
    myy1 = -dizziness * 20 + random(dizziness * 40);
if (round(random(100)) == 2)
    myy2 = -dizziness * 20 + random(dizziness * 40);

