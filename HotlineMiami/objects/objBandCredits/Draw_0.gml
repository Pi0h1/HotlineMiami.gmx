__view_set( e__VW.Angle, 0, lengthdir_x(2, dir * 0.2) );
draw_rectangle_color(-30, -30, room_width + 30, room_height + 30, merge_color(c_black, c_dkgray, 0.1 + random(0.1)), merge_color(c_black, c_dkgray, 0.1 + random(0.1)), merge_color(c_black, c_maroon, random(0.1)), merge_color(c_black, c_maroon, random(0.1)), 0);
draw_set_blend_mode(bm_add);
draw_circle_color(room_width / 2, room_height / 3, 192 + lengthdir_x(16, dir * 0.1), c_maroon, c_black, 0);
draw_set_blend_mode(bm_normal);
draw_set_color(merge_color(c_red, c_orange, 0.6 + lengthdir_x(0.2, dir * 3)));
draw_circle(room_width / 2, room_height / 3, 8, 0);
draw_set_color(merge_color(c_black, c_dkgray, random(0.05)));
color = merge_color(merge_color(c_purple, c_maroon, 0.7 + lengthdir_x(0.3, dir * 0.1)), merge_color(c_black, c_orange, 0.05 + lengthdir_x(0.02, dir * 0.14)), 0.85 + lengthdir_x(0.05, dir * 0.3));
draw_rectangle_color(-30, room_height / 3, room_width + 30, room_height + 30, c_black, c_black, color, color, 0);
with (objWave) {
    image_xscale = 1 + y * 0.02;
    if (y > 0)
        image_yscale = y * 0.01;
    else image_yscale = 0;
    dir += 2;
    if (y < 0)
        image_blend = c_black;
    else image_blend = merge_color(c_black, c_red, y * (1 / (room_height + 32)));
    i = 0;
    repeat(6) {
        draw_sprite_ext(sprite_index, index[i], x + i * (sprite_get_width(sprite_index) * 0.5) * image_xscale, room_height / 2 + y * 0.5 * image_xscale, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
        draw_sprite_ext(sprite_index, index[i], x - i * (sprite_get_width(sprite_index) * 0.5) * image_xscale, room_height / 2 + y * 0.5 * image_xscale, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
        index[i] += 0.1;
        i++;
    }
    if (y < room_height + 60)
        y += 0.5;
    else y = -30;
}
if (surface_exists(global.surf1)) {
    draw_surface_ext(global.surf1, 0, -1, 1, 1, 0, c_black, 1);
    draw_surface_ext(global.surf1, 0, 1, 1, 1, 0, c_black, 1);
    draw_surface_ext(global.surf1, -1, 0, 1, 1, 0, c_black, 1);
    draw_surface_ext(global.surf1, 1, 0, 1, 1, 0, c_black, 1);
    draw_surface_ext(global.surf1, 0, 0, 1, 1, 0, c_white, 1);
}
d3d_set_projection_ortho(0, 0, __view_get( e__VW.WView, 0 ), __view_get( e__VW.HView, 0 ), 0);


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
        sxeasy_setVolume(c_amount * (1 / 180));
        color1 = merge_color(c_black, merge_color(c_aqua, c_white, 0.5 + lengthdir_x(0.5, c_amount)), 0.5 + lengthdir_x(0.5, c_amount));
        if (c_amount > 90)
            color2 = merge_color(c_black, merge_color(c_fuchsia, c_white, abs(lengthdir_y(1, c_amount))), abs(lengthdir_y(1, c_amount)));
        else color2 = c_white;
        draw_set_blend_mode(bm_subtract);
        draw_rectangle_color(__view_get( e__VW.XView, 0 ) - 10, __view_get( e__VW.YView, 0 ) - 10, __view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 ) + 10, __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 ) + 10, color2, color1, color1, color2, 0);
        draw_set_blend_mode(bm_normal);
    } else {
    
        if (file_exists(working_directory + "\\xbox") && !global.xbox)
            file_delete(working_directory + "\\xbox");
        if (file_exists(working_directory + "\\steamon"))
            file_delete(working_directory + "\\steamon");
        if (file_exists(working_directory + "\\steamoff"))
            file_delete(working_directory + "\\steamoff");
        if (file_exists(working_directory + "\\alienware"))
            file_delete(working_directory + "\\alienware");
            
        if (global.steamon) {
            SteamShutdown()
            steamdll_free()
        }
        
        if (global.xbox)
            dllfree();
        if (global.alienware)
            scrAlienWareFree();
        sxeasy_close();
        sleep(250);
        game_end();
    }
}


draw_set_color(c_black);
if (current > 9) {
    if (blackx < 150)
        blackx += (blackx - 29) * 0.05;
    else fade = 1;
}
draw_rectangle(0, 0, __view_get( e__VW.WView, 0 ), blackx, 0);
draw_rectangle(0, __view_get( e__VW.HView, 0 ) - blackx, __view_get( e__VW.WView, 0 ), __view_get( e__VW.HView, 0 ), 0);
drawVignette();

