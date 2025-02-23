///txtMessage(x,y,string,font,scale,alpha)
var enableRound=0;
var rectangleAlpha=1;
var scale=argument4;
var angle=0;

var rectangleWidth=(string_width(argument2)*0.375)+(32*scale);
var rectangleHeight=12.5;
draw_set_alpha(argument5)

scrDrawRectangle(
argument0 - (rectangleWidth*0.75), argument1 + (rectangleHeight), //x1,y1
argument0 + (rectangleWidth*0.75), argument1 - (rectangleHeight), //x2,y2
c_black,
false,enableRound,rectangleAlpha
)

scrDrawRectangle(
argument0 - (rectangleWidth*0.75), argument1 + (rectangleHeight), //x1,y1
argument0 + (rectangleWidth*0.75), argument1 - (rectangleHeight*0.5), //x2,y2
c_ltgray,
false,enableRound,rectangleAlpha
)
draw_set_alpha(1)

texture_set_interpolation(true)
draw_set_font(argument3) 
draw_set_halign(fa_center)
draw_set_valign(fa_left)
draw_text_transformed_colour(argument0,argument1-11,"System message", scale*0.125, scale*0.125, angle, c_white,c_white,c_white,c_white,argument5)


draw_set_font(argument3) 
draw_set_halign(fa_center)
draw_set_valign(fa_center)
draw_text_transformed_colour(argument0,argument1+4,argument2, scale*0.25, scale*0.25, angle, c_black,c_black,c_black,c_black,argument5)
texture_set_interpolation(false)


scrDefaultText();
