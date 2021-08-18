//  scrScoreText(x,y,string,update)
draw_set_halign(fa_center)
draw_set_valign(fa_center)
//      -    SCORE      -       //
if argument3 = true {
if update = 0 draw_set_font(fntScore) else {draw_set_color(c_white) draw_set_font(fntScoreUpdate)}
}
else
{
draw_set_font(fntScore)
}
    //      shadow      //
draw_text_transformed_colour(
    argument0*0.5+lengthdir_x(1,dir),
    argument1+lengthdir_y(1, dir), 
    argument2,
    1, 
    1, 
    lengthdir_x(2, dir * 1.34),
    color1,color1,color1,color1,1
)
    //      front      //
draw_text_transformed_colour(
    argument0*0.5+lengthdir_x(1,dir-180),
    argument1+lengthdir_y(1,dir-180),
    argument2,
    1,
    1,
    lengthdir_x(2,dir*1.34-10),
    color2,color2,color2,color2,1
)
