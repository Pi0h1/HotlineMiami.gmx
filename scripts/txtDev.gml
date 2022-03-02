///txtDev(x,y,string,font,scale)
var scale=argument4;
var angle=0;

draw_set_font(argument3) 
draw_set_halign(fa_left)
draw_set_valign(fa_left)
draw_text_transformed_colour(argument0,argument1-(1*scale),argument2, scale, scale, angle, c_black,c_black,c_black,c_black,1)
draw_text_transformed_colour(argument0,argument1+(1*scale),argument2, scale, scale, angle, c_black,c_black,c_black,c_black,1)
draw_text_transformed_colour(argument0-(1*scale),argument1,argument2, scale, scale, angle, c_black,c_black,c_black,c_black,1)
draw_text_transformed_colour(argument0+(1*scale),argument1,argument2, scale, scale, angle, c_black,c_black,c_black,c_black,1)
draw_text_transformed_colour(argument0,argument1,argument2, scale, scale, angle, c_white,c_white,c_white,c_white,1)

draw_set_halign(fa_left)
draw_set_valign(fa_top)
