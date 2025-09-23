if (view_current == 0) {
    draw_sprite_ext(sprite_index, image_index, x + 1, y + 1, image_xscale, image_yscale, image_angle, c_black, 0.5);
    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);

    draw_set_blend_mode(bm_subtract);
    color1 = merge_color(c_olive, c_maroon, 0.5 + lengthdir_x(0.5, dir));
    color2 = merge_color(c_orange, c_purple, 0.5 + lengthdir_x(0.5, dir));
    draw_rectangle_color(0, 0, 400, 140, color1, color1, color2, color2, 0);
    draw_rectangle_color(0, 130, 400, 140, c_black, c_black, c_white, c_white, 0);
    draw_set_blend_mode(bm_normal);

    if (!fade) {
        if (c_amount < 180) {
            c_amount += 2;
            color1 = merge_color(c_black, merge_color(c_aqua, c_white, 0.5 + lengthdir_x(0.5, c_amount)), 0.5 + lengthdir_x(0.5, c_amount));
            if (c_amount > 90)
                color2 = merge_color(c_black, merge_color(c_fuchsia, c_white, abs(lengthdir_y(1, c_amount))), abs(lengthdir_y(1, c_amount)));
            else color2 = c_white;
            draw_set_blend_mode(bm_subtract);
            draw_rectangle_color(__view_get( e__VW.XView, 0 ) - 10, __view_get( e__VW.YView, 0 ) - 10, __view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 ) + 10, __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 ) + 10, color1, color2, color2, color1, 0);
            draw_set_blend_mode(bm_normal);
        }
    }

    if (fade) {
        if (c_amount > 0) {
            c_amount -= 5;
            sxeasy_setVolume(c_amount * (1 / 180));
            color1 = merge_color(c_black, merge_color(c_aqua, c_white, 0.5 + lengthdir_x(0.5, c_amount)), 0.5 + lengthdir_x(0.5, c_amount));
            if (c_amount > 90)
                color2 = merge_color(c_black, merge_color(c_fuchsia, c_white, abs(lengthdir_y(1, c_amount))), abs(lengthdir_y(1, c_amount)));
            else color2 = c_white;
            draw_set_blend_mode(bm_subtract);
            draw_rectangle_color(__view_get( e__VW.XView, 0 ) - 10, __view_get( e__VW.YView, 0 ) - 10, __view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 ) + 10, __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 ) + 10, color2, color1, color1, color2, 0);
            draw_set_blend_mode(bm_normal);
        } else {
            if (global.newmasks > 0) {
                sxeasy_stop(0);
                room_goto(rmUnlock);
            } else {
                sxeasy_stop(0);
                bgm_Close();
                game_restart();
            }
        }
    }

    dir++;
} else {
    draw_set_font(fntDate);
    draw_set_halign(fa_center);
    draw_set_valign(fa_top);
    draw_set_color(merge_color(c_fuchsia, c_purple, 0.5 + lengthdir_x(0.5, dir)));
    draw_text(201, credits_y + 1, string_hash_to_newline(credits));
    draw_set_color(merge_color(c_white, c_aqua, 0.5 + lengthdir_x(0.5, dir - 90)));
    draw_text(200, credits_y, string_hash_to_newline(credits));
    draw_set_blend_mode(bm_subtract);
    draw_rectangle_color(0, 140, 400, 150, c_white, c_white, c_black, c_black, 0);
    draw_set_blend_mode(bm_normal);
    draw_set_alpha(0.5 + lengthdir_x(0.5, c_amount));
    draw_set_color(c_black);
    if (c_amount < 180)
        draw_rectangle(0, 0, 400, 256, 0);
    draw_set_alpha(1);
}

