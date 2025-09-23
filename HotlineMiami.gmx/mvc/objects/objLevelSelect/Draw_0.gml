dir += 0.25;
color2 = merge_color(c_black, merge_color(c_aqua, c_fuchsia, 0.5 + lengthdir_x(0.5, dir * 3.12)), 0.5 + lengthdir_x(0.25, dir * 1.13));
color1 = merge_color(c_black, merge_color(merge_color(c_lime, c_yellow, 0.5 + lengthdir_x(0.5, dir * 3.12)), c_maroon, 0.125 + lengthdir_y(0.125, dir * 1.73)), 0.35 + lengthdir_y(0.25, dir * 1.73));
d3d_set_projection_ortho(0, 0, __view_get( e__VW.WView, 0 ), __view_get( e__VW.HView, 0 ), 0);
draw_rectangle_color(__view_get( e__VW.XView, 0 ), __view_get( e__VW.YView, 0 ) + 44, __view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 ), __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 ) - 43, color1, color1, color2, color2, 0);

global.color3 = merge_color(merge_color(merge_color(c_blue, c_red, 0.5 + lengthdir_x(0.5, dir * 3.12)), c_yellow, 0.125 + lengthdir_y(0.125, dir * 1.73)), merge_color(c_white, c_fuchsia, 0.5 + lengthdir_x(0.3, dir)), 0.5 + lengthdir_x(0.5, dir * 2.33));
draw_set_blend_mode(bm_add);
with (objPalmTree) {
    draw_sprite_general(sprPalmTrees, image_index, 0, 0, 82, 256, room_width / 2 + amount, room_height * 0.5 - (250 * (amount / 240)), amount / 240, (amount / 120), 0, global.color3, global.color3, c_black, c_black, 1);
    draw_sprite_general(sprPalmTrees, image_index, 0, 0, 82, 256, room_width / 2 - amount - (amount / 240) * 82, room_height * 0.5 - (250 * (amount / 240)), -amount / 240, amount / 120, 0, global.color3, global.color3, c_black, c_black, 1);
}

draw_set_blend_mode(bm_normal);
d3d_set_projection_ortho(0, 0, __view_get( e__VW.WView, 0 ), __view_get( e__VW.HView, 0 ), __view_get( e__VW.Angle, 0 ));
if (surface_exists(global.surf1)) {
    draw_surface_ext(global.surf1, 0, -1, 1, 1, 0, c_black, 1);
    draw_surface_ext(global.surf1, -1, 0, 1, 1, 0, c_black, 1);
    draw_surface_ext(global.surf1, 0, 1, 1, 1, 0, c_black, 1);
    draw_surface_ext(global.surf1, 1, 0, 1, 1, 0, c_black, 1);
    draw_surface_ext(global.surf1, 0, 0, 1, 1, 0, merge_color(c_white, merge_color(c_aqua, c_fuchsia, 0.5 + lengthdir_x(0.5, dir * 3)), 0.25 + lengthdir_x(0.25, dir)), 1);
}
currentmask = scrLevelGetMask(select);
if (currentmask >= 0) {
    if (global.masks[currentmask] == 0)
        color = c_black;
    else color = c_white;
    draw_sprite_ext(sprMaskDropFront, currentmask, 400 + 156 + addx * 3.3, 125, 1, 1, -90, color, 1);
} else draw_sprite_ext(sprNoMask, 0, 400 + 156 + addx * 3.3, 125, 1, 1, 0, c_white, 1);
if (select <= 15) {
    if (global.letter[scrLevelGetPuzzle(select)] == 1)
        draw_sprite_ext(sprToken, 0, 400 + 156 + addx * 3.3 + 11, 125, 1, 1, 0, c_white, 1);
    else draw_sprite_ext(sprToken, 0, 400 + 156 + addx * 3.3 + 11, 125, 1, 1, 0, c_black, 1);
}
if (!fade) {
    if (c_amount < 180) {
        c_amount += 10;
        color1 = merge_color(c_black, merge_color(c_aqua, c_white, 0.5 + lengthdir_x(0.5, c_amount)), 0.5 + lengthdir_x(0.5, c_amount));
        if c_amount > 90 color2 = merge_color(c_black, merge_color(c_fuchsia, c_white, abs(lengthdir_y(1, c_amount))), abs(lengthdir_y(1, c_amount)));
        else color2 = c_white;
        draw_set_blend_mode(bm_subtract);
        draw_rectangle_color(__view_get( e__VW.XView, 0 ) - 10, __view_get( e__VW.YView, 0 ) - 10, __view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 ) + 10, __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 ) + 10, color1, color2, color2, color1, 0);
        draw_set_blend_mode(bm_normal);
    }
}

if (fade) {
    if (c_amount > 0) {
        c_amount -= 5;
        if (!restart)
            sxeasy_setVolume(c_amount * (1 / 180));
        color1 = merge_color(c_black, merge_color(c_aqua, c_white, 0.5 + lengthdir_x(0.5, c_amount)), 0.5 + lengthdir_x(0.5, c_amount));
        if (c_amount > 90)
            color2 = merge_color(c_black, merge_color(c_fuchsia, c_white, abs(lengthdir_y(1, c_amount))), abs(lengthdir_y(1, c_amount)));
        else color2 = c_white;
        draw_set_blend_mode(bm_subtract);
        draw_rectangle_color(__view_get( e__VW.XView, 0 ) - 10, __view_get( e__VW.YView, 0 ) - 10, __view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 ) + 10, __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 ) + 10, color2, color1, color1, color2, 0);
        draw_set_blend_mode(bm_normal);
    } else {
        if (!restart) {
            sxeasy_stop();
            sxeasy_setVolume(1);
            if (newsong)
                sxeasy_play(song);
            if (global.level == rmHospitalTitle)
                room_goto(rmHospitalTitle);
            else {
                if (intro)
                    room_goto(mylevel);
                else {
                    if (select <= 15 || select >= 20)
                        room_goto(rmChapter);
                    else room_goto(rmMCChapter);
                }
            }
        } else room = rmMenu;
    }
}



d3d_set_projection_ortho(0, 0, __view_get( e__VW.WView, 0 ), __view_get( e__VW.HView, 0 ), 0);
draw_set_color(c_black);
draw_rectangle(0, 0, room_width, 44, 0);
draw_rectangle(0, room_height, room_width, room_height - 44, 0);

drawVignette();

