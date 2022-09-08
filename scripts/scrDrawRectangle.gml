/// scrDrawRectangle(x1, y1, x2, y2, color1, hasWhiteOutline, isRounded, alpha)
/*              
        RECTANGLES! I love them ♥            
    x1,y1________________________
col1--->\                       \<---col2
        \   Quick reference!    \
col4--->\_______________________\<---col3
                                x2,y2
*/ 

var hasWhiteOutline=argument5;
var isRounded = argument6;
draw_set_alpha(argument7);
// Modern experiment

if isRounded{
    
    if hasWhiteOutline{
    draw_roundrect_colour(
    argument0-3,argument1+3, //x1,y1
    argument2+3,argument3-3, //x2,y2
    c_black,c_black,0
    )   
    draw_roundrect_colour(
    argument0-2, argument1+2, //x1,y1
    argument2+2, argument3-2, //x2,y2
    c_white,c_white,0
    )   
    draw_roundrect_colour(
    argument0-1, argument1+1, //x1,y1
    argument2+1, argument3-1, //x2,y2
    c_black,c_black,0
    )   
    }
    
    draw_roundrect_colour(
    argument0, argument1, //x1,y1
    argument2, argument3, //x2,y2
    argument4,argument4,0
    )
    
} else {
    if hasWhiteOutline{
    draw_rectangle_colour(
    argument0-3,argument1+3, //x1,y1
    argument2+3,argument3-3, //x2,y2
    c_black,c_black,c_black,c_black,0
    )   
    draw_rectangle_colour(
    argument0-2, argument1+2, //x1,y1
    argument2+2, argument3-2, //x2,y2
    c_white,c_white,c_white,c_white,0
    )   
    draw_rectangle_colour(
    argument0-1, argument1+1, //x1,y1
    argument2+1, argument3-1, //x2,y2
    c_black,c_black,c_black,c_black,0
    )   
    }
    
    draw_rectangle_colour(
    argument0, argument1, //x1,y1
    argument2, argument3, //x2,y2
    argument4,argument4,argument4,argument4,0
    )
}
draw_set_alpha(1);
