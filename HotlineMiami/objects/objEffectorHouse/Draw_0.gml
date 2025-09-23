if (instance_exists(objPlayer)) {
    width = display_get_width();
    height = display_get_height();
    factor = 1;

    if (global.xbox) {
        if (checkbutton(0, getid(9))) {
            global.mousex = objPlayer.x + rightthumb_x(0) * 0.009;
            global.mousey = objPlayer.y - rightthumb_y(0) * 0.006;
        } else {
            if (objPlayer.object_index == objPlayerMouse || objPlayer.object_index == objPlayerMouseHouse || objPlayer.object_index == objPlayerBiker || objPlayer.object_index == objPlayerBikerHouse) {
                global.mousex = objPlayer.x + lengthdir_x(64, objPlayer.dir);
                global.mousey = objPlayer.y + lengthdir_y(64, objPlayer.dir);
            } else {
                global.mousex = objPlayer.x;
                global.mousey = objPlayer.y;
            }
        }
    } else {
        if (keyboard_check_direct(vk_shift))
            factor = 1.8;
        global.mousex = objPlayer.x + ((display_mouse_get_x() - width * 0.5) * (__view_get( e__VW.WView, 0 ) / width)) * factor;
        global.mousey = objPlayer.y + ((display_mouse_get_y() - height * 0.5) * (__view_get( e__VW.HView, 0 ) / height)) * factor;
    }
    x = global.mousex;
    y = global.mousey;
    if (instance_exists(global.enemy)) {
        global.mousex = global.enemy.x;
        global.mousey = global.enemy.y;
    } else global.enemy = -1234;
}
if (!instance_exists(objMaskMenu) && !instance_exists(objPhoneConversation))
    global.time++;
if (instance_exists(objDizzy))
    exit;
if (blackx < 15)
    blackx++;
global.dir++;
if (action > 0) {
    image_blend = merge_color(merge_color(c_aqua, c_fuchsia, 0.5 + lengthdir_x(0.5, global.dir * 3.27)), c_white, 0.5 + lengthdir_y(0.5, global.dir * 1.97));
    test = 1;
    if (!instance_exists(objPlayer))
        test = 0;
    if (instance_exists(objPlayerMouseHouse)) {
        if (!objPlayer.aimon)
            test = 0;
    }
    if (test) {
        draw_sprite_ext(sprCursorAction, action - 1, global.mousex + 1, global.mousey + 1, 1, 1, -__view_get( e__VW.Angle, 0 ), c_black, 0.5);
        draw_sprite_ext(sprCursorAction, action - 1, global.mousex, global.mousey, 1, 1, -__view_get( e__VW.Angle, 0 ), image_blend, 1);
    }
}

test = 1;
if (!instance_exists(objPlayer))
    test = 0;
if (instance_exists(objPlayerMouseHouse)) {
    if (!objPlayer.aimon)
        test = 0;
}
if (instance_exists(objPhoneConversation) || instance_exists(objFinalDialogue) || instance_exists(objFinalDialogue2))
    test = 0;
if (test) {
    draw_sprite_ext(sprite_index, image_index, global.mousex + 1, global.mousey + 1, 1, 1, -__view_get( e__VW.Angle, 0 ), c_black, 0.5);
    draw_set_blend_mode(bm_cursor);
    draw_sprite_ext(sprite_index, image_index, global.mousex, global.mousey, 1, 1, -__view_get( e__VW.Angle, 0 ), c_cursor, 1);
    draw_set_blend_mode(bm_normal);
}
with (objAnsweringMachine) {
    if (active && sprite_index == sprDrawersH24Phone)
        draw_sprite(sprArrow, image_index * 2, x, y - 16 + lengthdir_x(3, global.dir * 6));
}
with (objPhone) {
    if (called && !answered)
        draw_sprite_ext(sprArrow, 0, x, y - 12 + lengthdir_x(3, dir * 2), 1, 1, 0, c_white, 1);
}

with (objBox) {
    if (global.phone)
        draw_sprite(sprArrow, global.dir, x, y - 16 + lengthdir_x(3, global.dir * 6));
}


if (room == rmMansionMainHall) {
    if (instance_exists(objBoss)) {
        with (objSpecificWeapon) {
            if (image_index == 20 && instance_exists(objBodyguard))
                draw_sprite(sprArrow, global.dir, x, y - 16 + lengthdir_x(3, global.dir * 6));
            if ((image_index == 34 && !instance_exists(objBodyguard)) && !instance_exists(objPBodyguardBash) && !instance_exists(objBodyguardCrawl) && !instance_exists(objPKillBodyguard))
                draw_sprite(sprArrow, global.dir, x, y - 16 + lengthdir_x(3, global.dir * 6));
        }
    }
}

d3d_set_projection_ortho(0, 0, __view_get( e__VW.WView, 0 ), __view_get( e__VW.HView, 0 ), 0);

if (room == rmSequence12b) {
    if (!instance_exists(objPlayer)) {
        dir += 8;
        color2 = merge_color(merge_color(c_aqua, c_fuchsia, 0.5 + lengthdir_x(0.5, dir * 2.32)), c_white, 0.5 + lengthdir_x(0.5, dir * 3));
        color1 = merge_color(c_maroon, merge_color(c_aqua, c_fuchsia, 0.5 - lengthdir_x(0.5, dir * 2.32)), 0.75 + lengthdir_x(0.25, dir * 3));
        draw_set_halign(fa_center);
        draw_set_valign(fa_center);
        ammostring = "R TO RESTART!";
        if (ammoy < 40)
            ammoy++;
        else ammoy = 40;
        if (!update)
            draw_set_font(fntScore);
        else draw_set_font(fntScoreUpdate);
        draw_set_color(c_black);
        draw_set_font(fntScore);
        draw_rectangle(0, __view_get( e__VW.HView, 0 ) - ammoy - 11, 18 + string_width(string_hash_to_newline(ammostring)) + 6, __view_get( e__VW.HView, 0 ) - ammoy + 11, 0);
        draw_set_font(fntScore);
        draw_set_color(color1);
        draw_set_font(fntScore);
        if (ammoy > -32)
            draw_text_transformed(18 + string_width(string_hash_to_newline(ammostring)) * 0.5 + lengthdir_x(1, dir), __view_get( e__VW.HView, 0 ) - ammoy + lengthdir_y(1, dir), string_hash_to_newline(ammostring), 1, 1, lengthdir_x(2, dir));
        draw_set_color(color2);
        if (ammoy > -32)
            draw_text_transformed(18 + string_width(string_hash_to_newline(ammostring)) * 0.5 + lengthdir_x(1, dir - 180), __view_get( e__VW.HView, 0 ) - ammoy + lengthdir_y(1, dir - 180), string_hash_to_newline(ammostring), 1, 1, lengthdir_x(2, dir - 10));
    }
}


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
            if (targetstrength == 1) {
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
    if (blackx > 15) {
        if (phonex > 0)
            phonex -= 10;
        if (phonex > 40) {
            if (blackx > 15)
                blackx -= 2.5;
        }

        if (phonex > 0) {
            phonecolor1 = merge_color(c_orange, c_lime, 0.5 + lengthdir_x(0.25, global.dir * 2));
            phonecolor2 = merge_color(c_maroon, c_navy, 0.5 + lengthdir_x(0.25, global.dir * 2));
            if (instance_exists(objLightingEngine)) {
                with (objLight) {
                    if (targetstrength == 1) {
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



if (leveltitle == "") {
    // do nothing
} else {
    if (levelshow > 0)
        levelshow--;
    else leveltitle = "";
    draw_set_font(fntDate);
    draw_set_halign(fa_center);
    draw_set_valign(fa_top);
    if (levelshow > 180)
        draw_set_alpha((240 - levelshow) * (1 / 60));
    if (levelshow < 60)
        draw_set_alpha(levelshow * (1 / 60));
    draw_set_color(c_black);
    draw_text(__view_get( e__VW.WView, 0 ) / 2 + 1, __view_get( e__VW.HView, 0 ) * 0.7 + 1, string_hash_to_newline(leveltitle));
    draw_set_color(c_white);
    draw_text(__view_get( e__VW.WView, 0 ) / 2, __view_get( e__VW.HView, 0 ) * 0.7, string_hash_to_newline(leveltitle));
    draw_set_alpha(1);
}

with (objGoToCar) {
    if (ammoy < 36)
        ammoy += 4;
    else ammoy = 40;
    draw_set_color(c_black);
    draw_set_font(fntScore);
    ammostring = "GO TO CAR!";
    draw_set_halign(fa_center);
    draw_set_valign(fa_center);
    draw_rectangle(0, __view_get( e__VW.HView, 0 ) - ammoy - 11, 18 + string_width(string_hash_to_newline(ammostring)) + 6, __view_get( e__VW.HView, 0 ) - ammoy + 11, 0);
    draw_set_color(merge_color(c_teal, c_red, 0.5 + lengthdir_x(0.5, dir)));
    draw_text_transformed(18 + string_width(string_hash_to_newline(ammostring)) * 0.5 + lengthdir_x(1, dir), __view_get( e__VW.HView, 0 ) - ammoy + lengthdir_y(1, dir), string_hash_to_newline(ammostring), 1, 1, lengthdir_x(2, dir * 1.34));
    draw_set_color(merge_color(c_white, c_yellow, 0.2 + lengthdir_x(0.2, dir)));
    dir += 10;
    draw_text_transformed(18 + string_width(string_hash_to_newline(ammostring)) * 0.5 + lengthdir_x(1, dir - 180), __view_get( e__VW.HView, 0 ) - ammoy + lengthdir_y(1, dir - 180), string_hash_to_newline(ammostring), 1, 1, lengthdir_x(2, dir * 1.34 - 10));
}

scrStoryDrawAmmo();


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
                    if (room == rmDream1)
                        sxeasy_setVolume(0);
                    sxeasy_play(song);
                }
                if (room == rmTutorial)
                    sxeasy_stop(1);
                room = nextroom;
            } else {
                scrResetSurfaces();
                legacy_load(working_directory + "\\tempsave.sav");
            }
        }
    }
}
coldir++;

scrDrawPlayer();

if (show_date) {
    switch (room) {
        case rmSequence1: text = "April 3rd, 1989#Miami - Florida"; break;
        case rmSequence2: text = "April 8th, 1989#Miami - Florida"; break;
        case rmSequence3: text = "April 16th, 1989#Miami - Florida"; break;
        case rmSequence4: text = "April 25th, 1989#Miami - Florida"; break;
        case rmSequence5: text = "May 5th, 1989#Miami - Florida"; break;
        case rmSequence6: text = "May 11th, 1989#Miami - Florida"; break;
        case rmSequence7: text = "May 13th, 1989#Miami - Florida"; break;
        case rmSequence8: text = "May 23rd, 1989#Miami - Florida"; break;
    }
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

if (brus > 0) {
    brus--;
    if (lastbrus == 0)
        audio_play_sound(sndNoise, 0, false);
    lastbrus = brus;
    if (brus == 0)
        audio_stop_sound(sndNoise);
    draw_sprite_tiled(sprNoise, global.dir * 0.5, 0, 0);
    draw_set_color(c_black);
    draw_rectangle(0, 0, __view_get( e__VW.WView, 0 ), blackx, 0);
    draw_rectangle(0, __view_get( e__VW.HView, 0 ), __view_get( e__VW.WView, 0 ), __view_get( e__VW.HView, 0 ) - blackx * 1.5, 0);
}


draw_set_blend_mode(bm_subtract);
draw_circle_color(__view_get( e__VW.WView, 0 ) / 2, __view_get( e__VW.HView, 0 ) / 2, 240 + 24 + random(24) + 24, c_black, merge_color(c_navy, c_aqua, 0.25 + random(0.25)), 0);
draw_set_blend_mode(bm_normal);

