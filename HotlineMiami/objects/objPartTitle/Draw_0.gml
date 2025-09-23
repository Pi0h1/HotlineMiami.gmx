if (c_amount >= 180 && !fade) {
    if (letter < string_length(global.parttitle[current])) {
        letter += 0.1;
        if (floor(letter) > floor(letter - 0.1)) {
            if (string_copy(global.parttitle[current], letter + 1, 1) == " "
            || letter >= string_length(global.parttitle[current])) {
                // do nothing
            } else audio_play_sound(sndLetter, 0, false);
            amount[i] = 10;
        }
    }
}

color1 = merge_color(merge_color(c_dkgray, c_navy, 0.5 + lengthdir_x(0.5, dir * 0.5)), merge_color(c_black, c_teal, 0.2 + lengthdir_x(0.2, dir * 0.67)), 0.6 + lengthdir_x(0.3, dir));
__view_set( e__VW.Angle, 0, lengthdir_x(2, dir) );
color1 = merge_color(color1, make_color_hsv(0, 0, 5 + random(3)), 0.75);
color2 = c_black;
d3d_set_projection_ortho(0, 0, 400, 256, 0);
draw_rectangle_color(0, 64, room_width, room_height - 64, color1, color1, color2, color2, 0);

draw_set_blend_mode(bm_subtract);

i = 0;
repeat(30) {
    draw_circle_color(myx[i], myy[i], size[i] + random(0.5), c_white, c_black, 0);
    myx[i] += lengthdir_x(myspeed[i], mydir[i]);
    myy[i] += lengthdir_y(myspeed[i], mydir[i]);
    mydir[i] += diradd[i];
    if (round(random(30)) == 2)
        diradd[i] = -4 + random(8)
    if (myx[i] < 0)
        myx[i] += room_width;
    if (myy[i] < 64) myy[i]
        += room_height - 128;
    if (myy[i] > room_height - 64)
        myy[i] -= room_height - 128;
    if (myx[i] > room_width)
        myx[i] -= room_width;
    i++;
}
draw_set_blend_mode(bm_normal);


d3d_set_projection_ortho(__view_get( e__VW.XView, 0 ), __view_get( e__VW.YView, 0 ), __view_get( e__VW.WView, 0 ), __view_get( e__VW.HView, 0 ), __view_get( e__VW.Angle, 0 ));
draw_set_font(fntPart);
draw_set_valign(fa_center);
draw_set_halign(fa_left);
i = 0;
dir++;
start_x = room_width / 2 - string_width(string_hash_to_newline(global.parttitle[current])) * 0.5;
test = 0;
repeat (letter) {
    mystring = string_copy(global.parttitle[current], i + 1, 1);
    draw_set_color(c_black);
    draw_text_transformed(start_x, room_height / 2 - 1, string_hash_to_newline(mystring), 1, 1, 0);
    draw_text_transformed(start_x, room_height / 2 + 1, string_hash_to_newline(mystring), 1, 1, 0);
    draw_text_transformed(start_x + 1, room_height / 2, string_hash_to_newline(mystring), 1, 1, 0);
    draw_text_transformed(start_x - 1, room_height / 2, string_hash_to_newline(mystring), 1, 1, 0);
    draw_set_color(merge_color(c_black, merge_color(c_red, c_orange, 0.5 + lengthdir_x(0.5, dir + i * 5)), factor));
    draw_text_transformed(start_x, room_height / 2, string_hash_to_newline(mystring), 1, 1, 0);
    ii = 0;
    draw_set_blend_mode(bm_add);
    repeat (ceil(amount[i])) {
        draw_text_transformed(start_x + ii * 0.5 - random(ii), room_height / 2 + ii * 0.5 - random(ii), string_hash_to_newline(mystring), 1, 1, 0);
        ii++;
    }
    draw_set_blend_mode(bm_normal);
    if (amount[i] > 0)
        amount[i] -= 0.25;
    test += amount[i];
    i++;
    start_x += string_width(string_hash_to_newline(mystring));
}
if (!test && letter >= string_length(global.parttitle[current])) {
    if (factor > 0)
        factor -= 0.05;
    else {
        factor = 1;
        letter = 0;
        amount[0] = 10;
        if (current < texts)
            current++;
        else fade = 1;
    }
}
d3d_set_projection_ortho(0, 0, 400, 256, 0);


if (!fade) {
    if (c_amount < 180) {
        c_amount += 10;
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
        color1 = merge_color(c_black, merge_color(c_aqua, c_white, 0.5 + lengthdir_x(0.5, c_amount)), 0.5 + lengthdir_x(0.5, c_amount));
        if (c_amount > 90)
            color2 = merge_color(c_black, merge_color(c_fuchsia, c_white, abs(lengthdir_y(1, c_amount))), abs(lengthdir_y(1, c_amount)));
        else color2 = c_white;
        draw_set_blend_mode(bm_subtract);
        draw_rectangle_color(__view_get( e__VW.XView, 0 ) - 10, __view_get( e__VW.YView, 0 ) - 10, __view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 ) + 10, __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 ) + 10, color2, color1, color1, color2, 0);
        draw_set_blend_mode(bm_normal);
    } else {
        if (global.nextlevel == rmRewind || global.nextlevel == rmSequence12bDownstairs) {
            if (global.nextlevel == rmSequence12bDownstairs)
                sxeasy_play(working_directory + "\\TurfIntro.mp3");
        } else sxeasy_play(working_directory + "\\SilverLights.mp3");
        room_goto(global.nextlevel);
    }
}

draw_set_blend_mode(bm_subtract);
draw_circle_color(x, y, room_width * 0.75 + random(10), c_black, c_lime, 0);
draw_set_blend_mode(bm_normal);

