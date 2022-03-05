///txtConversation(x,y,string1,string2,alpha,font)
var xPos = argument0;
var yPos = argument1;
var txt1 = argument2;
var txt2 = argument3;
var modifier=lengthdir_x(0.5,global.dir*4);
var merge = argument4;
var scale = 1;
var angle = 0;
var alpha = 1;

var c_back  = merge_colour(merge_colour(c_maroon,c_teal,0.5+lengthdir_x(0.5,global.dir)),c_black,merge);
var c_front = merge_colour(merge_colour(c_white,c_yellow,0.25-lengthdir_x(0.25,global.dir)),c_black,merge);

draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_set_font(argument5)

// Line 1
draw_text_transformed_colour(xPos+1.5,yPos+1.5,txt1,scale,scale,angle,c_back,c_back,c_back,c_back,alpha)
draw_text_transformed_colour((xPos)-modifier,(yPos)-modifier,txt1,scale,scale,angle,c_front,c_front,c_front,c_front,alpha)

// Line 2
draw_text_transformed_colour(xPos+1.5,(yPos+18)+1.5,txt2,scale,scale,angle,c_back,c_back,c_back,c_back,alpha)
draw_text_transformed_colour((xPos)-modifier,(yPos+18)-modifier,txt2,scale,scale,angle,c_front,c_front,c_front,c_front,alpha)


scrDefaultText();
