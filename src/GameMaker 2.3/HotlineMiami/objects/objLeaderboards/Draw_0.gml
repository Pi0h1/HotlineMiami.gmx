dir2 += 0.25
color2 = make_color_hsv(0, 255, 15)
color1 = merge_color(c_yellow, merge_color(merge_color(c_fuchsia, c_red, 0.5 + lengthdir_x(0.5, dir2 * 3.12)), c_maroon, 0.125 + lengthdir_y(0.125, dir2 * 1.73)), 0.5 + lengthdir_y(0.5, dir2 * 1.73))
d3d_set_projection_ortho(0, 0, __view_get( e__VW.WView, 0 ), __view_get( e__VW.HView, 0 ), 0)
draw_rectangle_color(__view_get( e__VW.XView, 0 ), __view_get( e__VW.YView, 0 ) + 40, __view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 ), __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 ) - 40, color2, color2, color1, color1, 0)

color3 = merge_color(c_orange, c_yellow, 0.5 + lengthdir_x(0.5, dir2 * 3))
global.color = merge_color(color3, color1, 0.5)
draw_rectangle_color(__view_get( e__VW.XView, 0 ), room_height * 0.6, __view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 ), __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 ) - 40, color1, color1, color2, color2, 0)
with objWave {
    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, merge_color(global.color, c_white, 0.5 + lengthdir_x(0.5, dir)), image_alpha)
}

draw_set_blend_mode(bm_subtract)
draw_rectangle_color(__view_get( e__VW.XView, 0 ), __view_get( e__VW.HView, 0 ) - 39, __view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 ), __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 ) - 50, c_black, c_black, c_white, c_white, 0)
draw_set_blend_mode(bm_normal)
if housex > -144 housex -= 0.05
else housex += 144
i = 0 repeat(11) {
    draw_sprite_ext(sprHouseSilhouettes, 1, housex * 0.666 + i * 48, room_height * 0.6 - 2, 1, 1, 0, merge_color(c_black, global.color, 0.25), 1)
    draw_sprite_ext(sprHouseSilhouettes, 0, housex * 0.333 + i * 48, room_height * 0.6 - 1, 1, 1, 0, merge_color(c_black, global.color, 0.5), 1)
    draw_sprite_ext(sprHouseSilhouettes, 0, housex + i * 48, room_height * 0.6, 1, 1, 0, merge_color(c_black, global.color, 0.75), 1)
    i += 1
}

draw_surface_ext(global.surf1, -1, 0, 1, 1, 0, c_black, 1)
draw_surface_ext(global.surf1, 1, 0, 1, 1, 0, c_black, 1)
draw_surface_ext(global.surf1, 0, -1, 1, 1, 0, c_black, 1)
draw_surface_ext(global.surf1, 0, 1, 1, 1, 0, c_black, 1)
draw_surface_ext(global.surf1, 0, 0, 1, 1, 0, c_white, 1)

var o_i = 0;
var o_def = 4;
var loading_x = room_width/2;
var loading_y = room_height/2;
repeat(o_def){
    draw_sprite_ext(sprWeapons,loadingIndex,loading_x+lengthdir_x(1,o_i),loading_y+lengthdir_y(1,o_i),1,1,0,c_black,1);
    o_i+=(360/o_def);
}
draw_sprite(sprWeapons,loadingIndex,loading_x,loading_y);

loadingIndex+=loadingIconSpeed;

d3d_set_projection_ortho(0, 0, __view_get( e__VW.WView, 0 ), __view_get( e__VW.HView, 0 ), 0)
__view_set( e__VW.Angle, 0, lengthdir_y(2, dir * 2.33) )
if fade = 0 {
    if c_amount < 180 {
        c_amount += 10
        color1 = merge_color(c_black, merge_color(c_aqua, c_white, 0.5 + lengthdir_x(0.5, c_amount)), 0.5 + lengthdir_x(0.5, c_amount))
        if c_amount > 90 color2 = merge_color(c_black, merge_color(c_fuchsia, c_white, abs(lengthdir_y(1, c_amount))), abs(lengthdir_y(1, c_amount)))
        else color2 = c_white
        draw_set_blend_mode(bm_subtract)
        draw_rectangle_color(__view_get( e__VW.XView, 0 ) - 10, __view_get( e__VW.YView, 0 ) - 10, __view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 ) + 10, __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 ) + 10, color1, color2, color2, color1, 0)
        draw_set_blend_mode(bm_normal)
    }
}

d3d_set_projection_ortho(0, 0, __view_get( e__VW.WView, 0 ), __view_get( e__VW.HView, 0 ), 0)
draw_set_color(c_black)
drawVignette();

