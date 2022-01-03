//txtHotline2(x,y,"Text",fntMenu,1,c_aqua,c_red)
var xPos=argument0;
var yPos=argument1;
var txt=argument2;
draw_set_font(argument3) 
var scale=argument4;
var angle=0;
var alpha=1

var c_front=argument5;
var c_back=argument6;
var c_outline=c_black

var movement=lengthdir_x(0.5,global.dir*4);

draw_set_halign(fa_left)
draw_set_valign(fa_left)
draw_text_transformed_colour(xPos-(1*scale)-(movement*scale), yPos-(1*scale)-(movement*scale)   , txt,    scale, scale, angle,  c_outline ,c_outline,c_outline    ,c_outline                                                 ,alpha);
draw_text_transformed_colour(xPos+(2*scale)                 , yPos+(2*scale)                    , txt,    scale, scale, angle,  c_outline ,c_outline,c_outline    ,c_outline                                                 ,alpha);
draw_text_transformed_colour(xPos+(1*scale)                 , yPos+(1*scale)                    , txt,    scale, scale, angle,  c_back  ,c_back ,merge_colour(c_back,c_outline,0.5) ,merge_colour(c_back,c_outline,0.5)      ,alpha);
draw_text_transformed_colour(xPos-(movement*scale)          , yPos-(movement*scale)             , txt,    scale, scale, angle,  c_front ,c_front ,merge_colour(c_front,c_outline,0.5) ,merge_colour(c_front,c_outline,0.5)   ,alpha);
