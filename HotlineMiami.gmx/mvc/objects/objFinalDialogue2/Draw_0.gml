if (reload > 0)
    reload--;
d3d_set_projection_ortho(0, 0, __view_get( e__VW.WView, 0 ), __view_get( e__VW.HView, 0 ), 0);

if (change) {
    if (phonex > 0)
        phonex -= 10;
    else {
        index = face[current];
        change = 0;
    }
}

if (!stop) {
    if (blackx < 45)
        blackx += 2.5;
    if (blackx > 15) {
        if (!change) {
            if (phonex < 180)
                phonex += 10;
        }
    }


    phonecolor1 = merge_color(c_orange, c_lime, 0.5 + lengthdir_x(0.25, dir * 2));
    phonecolor2 = merge_color(c_maroon, c_navy, 0.5 + lengthdir_x(0.25, dir * 2));

    draw_triangle_color(__view_get( e__VW.WView, 0 ) - phonex, 0, __view_get( e__VW.WView, 0 ), 0, __view_get( e__VW.WView, 0 ), __view_get( e__VW.HView, 0 ), phonecolor1, phonecolor1, phonecolor2, 0);
    draw_triangle_color(__view_get( e__VW.WView, 0 ) - phonex, 0, __view_get( e__VW.WView, 0 ) - phonex + 70, __view_get( e__VW.HView, 0 ), __view_get( e__VW.WView, 0 ), __view_get( e__VW.HView, 0 ), phonecolor1, phonecolor2, phonecolor2, 0);
    draw_sprite_ext(sprPhoneLine, 0, __view_get( e__VW.WView, 0 ) - phonex, 0, 1, 2, 15, c_white, 1);
    draw_set_color(c_black);
    draw_rectangle(0, 0, __view_get( e__VW.WView, 0 ), blackx, 0);
    draw_rectangle(0, __view_get( e__VW.HView, 0 ), __view_get( e__VW.WView, 0 ), __view_get( e__VW.HView, 0 ) - blackx * 1.5, 0);
    draw_sprite_ext(index, dir * 0.1, __view_get( e__VW.WView, 0 ) - phonex + 128 + 2, __view_get( e__VW.HView, 0 ) / 2 + 3, image_xscale, image_yscale, lengthdir_x(4, dir * 1.67), c_black, 0.5);
    draw_sprite_ext(index, dir * 0.1, __view_get( e__VW.WView, 0 ) - phonex + 128, __view_get( e__VW.HView, 0 ) / 2, image_xscale, image_yscale, lengthdir_x(4, dir * 1.67), c_white, 1);
    if (blackx == 45) {
        textcolor1 = merge_color(merge_color(c_maroon, c_teal, 0.5 + lengthdir_x(0.5, dir)), c_black, reload * 0.1);
        textcolor2 = merge_color(merge_color(c_white, c_yellow, 0.25 - lengthdir_x(0.25, dir)), c_black, reload * 0.1);
        draw_set_color(textcolor1);
        draw_set_halign(fa_left);
        draw_set_valign(fa_top);
        draw_set_font(fntScore);
        if (!change) {
            draw_text(17, __view_get( e__VW.HView, 0 ) - 57, string_hash_to_newline(string_upper(line1[current])));
            draw_text(17, __view_get( e__VW.HView, 0 ) - 39, string_hash_to_newline(string_upper(line2[current])));
            draw_set_color(textcolor2);
            draw_text(15.5 - lengthdir_x(0.5, dir * 4), __view_get( e__VW.HView, 0 ) - 58.5 - lengthdir_x(0.5, dir * 4), string_hash_to_newline(string_upper(line1[current])));
            draw_text(15.5 - lengthdir_x(0.5, dir * 4), __view_get( e__VW.HView, 0 ) - 40.5 - lengthdir_x(0.5, dir * 4), string_hash_to_newline(string_upper(line2[current])));
        }
    }
} else {
    if (blackx > 0) {
        if (phonex > 0)
            phonex -= 10;
        if (phonex > 40) {
            if (blackx > 15)
                blackx -= 2.5;
        }

        if (phonex > 0) {
            phonecolor1 = merge_color(c_orange, c_lime, 0.5 + lengthdir_x(0.25, dir * 2));
            phonecolor2 = merge_color(c_maroon, c_navy, 0.5 + lengthdir_x(0.25, dir * 2));
        }
        draw_triangle_color(__view_get( e__VW.WView, 0 ) - phonex, 0, __view_get( e__VW.WView, 0 ), 0, __view_get( e__VW.WView, 0 ), __view_get( e__VW.HView, 0 ), phonecolor1, phonecolor1, phonecolor2, 0);
        draw_triangle_color(__view_get( e__VW.WView, 0 ) - phonex, 0, __view_get( e__VW.WView, 0 ) - phonex + 70, __view_get( e__VW.HView, 0 ), __view_get( e__VW.WView, 0 ), __view_get( e__VW.HView, 0 ), phonecolor1, phonecolor2, phonecolor2, 0);
        draw_sprite_ext(sprPhoneLine, 0, __view_get( e__VW.WView, 0 ) - phonex, 0, 1, 2, 15, c_white, 1);
    }
    draw_set_color(c_black);
    draw_rectangle(0, 0, __view_get( e__VW.WView, 0 ), blackx, 0);
    draw_rectangle(0, __view_get( e__VW.HView, 0 ), __view_get( e__VW.WView, 0 ), __view_get( e__VW.HView, 0 ) - blackx * 1.5, 0);
    if (phonex > 0) {
        draw_sprite_ext(index, dir * 0.1, __view_get( e__VW.WView, 0 ) - phonex + 128 + 2, __view_get( e__VW.HView, 0 ) / 2 + 3, image_xscale, image_yscale, lengthdir_x(4, dir * 1.67), c_black, 0.5);
        draw_sprite_ext(index, dir * 0.1, __view_get( e__VW.WView, 0 ) - phonex + 128, __view_get( e__VW.HView, 0 ) / 2, image_xscale, image_yscale, lengthdir_x(4, dir * 1.67), c_white, 1);
    }
}
dir++;
//drawVignette();

