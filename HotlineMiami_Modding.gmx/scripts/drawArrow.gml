/// drawArrow(angle, does it blink?)

// TO DO: FIX (formatting)
var angle = argument0;
var blink = argument1;
var dir = secUnit(8);
var arrowIndex=0;

if blink{
    arrowIndex = secUnit(0.2)
}

draw_sprite_ext(sprArrow,arrowIndex,x+lengthdir_x(16-lengthdir_x(3,dir),angle+90),y+lengthdir_y(16-lengthdir_x(3,dir),angle+90),1,1,angle,image_blend,image_alpha);
