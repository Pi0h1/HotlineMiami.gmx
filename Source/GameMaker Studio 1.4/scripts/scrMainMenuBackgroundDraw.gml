if (coldir < 180)   {coldir += 2;}
if (coldir < 90)    {coldir += 3;}
if (coldir <= 90)   {color = merge_color(c_black, merge_color(c_white, c_fuchsia, abs(lengthdir_y(1, coldir))), abs(lengthdir_y(1, coldir)));}
if (coldir > 90)    {color = merge_color(c_fuchsia, c_aqua, abs(lengthdir_x(1, coldir)));}
dir += 0.25;
color2 = c_black;
color1 = merge_color(c_black, merge_color(merge_color(c_fuchsia, c_aqua, 0.5 + lengthdir_x(0.5, dir * 3.12)), c_red, 0.125 + lengthdir_y(0.125, dir * 1.73)), 0.75 + lengthdir_y(0.25, dir * 1.73));
global.color3 = merge_color(merge_color(merge_color(c_blue, c_red, 0.5 + lengthdir_x(0.5, dir * 3.12)), c_yellow, 0.125 + lengthdir_y(0.125, dir * 1.73)), merge_color(c_white, c_fuchsia, 0.5 + lengthdir_x(0.3, dir)), 0.5 + lengthdir_x(0.5, dir * 2.33));
draw_rectangle_color(-20, -20, room_width + 20, room_height + 20, color1, color1, color2, color2, 0);
i = 0;
draw_set_blend_mode(bm_add);
with (objPalmTree) {
    draw_sprite_general(sprPalmTrees, image_index, 0, 0, 82, 256, room_width / 2 + amount, room_height * 0.7 - (320 * (amount / 240)), amount / 240, (amount / 120), 0, global.color3, global.color3, c_black, c_black, 1);
    draw_sprite_general(sprPalmTrees, image_index, 0, 0, 82, 256, room_width / 2 - amount - (amount / 240) * 82, room_height * 0.7 - (320 * (amount / 240)), -amount / 240, amount / 120, 0, global.color3, global.color3, c_black, c_black, 1);
}
draw_set_blend_mode(bm_normal);


color1 = merge_color(c_black, merge_color(c_aqua, c_white, 0.5 + lengthdir_x(0.5, c_amount)), 0.5 + lengthdir_x(0.5, c_amount));
if c_amount > 90 color2 = merge_color(c_black, merge_color(c_fuchsia, c_white, abs(lengthdir_y(1, c_amount))), abs(lengthdir_y(1, c_amount)));
else color2 = c_white;
