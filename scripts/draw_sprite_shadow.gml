/// draw_sprite_shadow(sprite,subimg,x,y,xscale,yscale,rotation)
var shadowOffset    = 1;
var shadowColor     = c_black;
var shadowOpacity   = 0.5;
draw_sprite_ext(argument0,argument1,argument2+shadowOffset,argument3+shadowOffset,argument4,argument5,argument6,shadowColor,shadowOpacity)
draw_sprite_ext(argument0,argument1,argument2,argument3,argument4,argument5,argument6,c_white,1)
