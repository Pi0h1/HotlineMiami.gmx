///  txtScore(x,y,string,font,scale)

//  Variables.
var align = fa_center;
var font = argument3;
draw_set_font(font)
var scale = argument4;
var color1 = merge_color(c_maroon, merge_color(c_aqua, c_fuchsia, 0.5 - lengthdir_x(0.5, dir * 2.32)), 0.75 + lengthdir_x(0.25, dir * 3));
var color2 = merge_color(merge_color(c_aqua, c_fuchsia, 0.5 + lengthdir_x(0.5, dir * 2.32)), c_white, 0.5 + lengthdir_x(0.5, dir * 3));
var modifier_x = lengthdir_x(1*scale, dir);
var modifier_y = lengthdir_x(1*scale, dir);
var frontModifier_x = lengthdir_x(1*scale, dir - 180);
var frontModifier_y = lengthdir_y(1*scale, dir - 180);
var angle = lengthdir_x(2, dir * 1.34 + 90) ;
var rectangleWidth=(string_width(argument2)*0.375)+(32*scale);
var rectangleHeight=12.5;

draw_set_halign(align)
draw_set_valign(align)

scrDrawRectangle(
argument0 - (rectangleWidth), argument1 + (rectangleHeight), //x1,y1
argument0 + (rectangleWidth), argument1 - (rectangleHeight), //x2,y2
c_black,
false
)

//  back      //
draw_text_transformed_colour(
argument0 + modifier_x, argument1 + modifier_y, argument2, scale, scale, angle,
color1,color1,merge_colour(color1,color1,0.5),merge_colour(color1,color1,0.5),1
)

//  front      //
draw_text_transformed_colour(
argument0 + frontModifier_x, argument1 + frontModifier_y, argument2, scale, scale, angle,
color2,color2,merge_colour(color2,color2,0.5),merge_colour(color2,color2,0.5),1
)


draw_set_halign(fa_left)
draw_set_valign(fa_top)
