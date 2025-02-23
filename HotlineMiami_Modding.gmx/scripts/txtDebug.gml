if (!global.devmode) exit;

/// txtSimple(x,y,string,outline)
/// txtSimple(x,y,text_WarningRAM,fntScore,true)
var outline = argument3;
draw_set_font(fntDebug)
draw_set_halign(fa_left);
var scale = 0.075;
texture_set_interpolation(true);
if (outline){
    draw_set_color(c_black)
    draw_text_transformed(argument0-(1*scale),argument1,argument2,scale,scale,0)
    draw_text_transformed(argument0+(1*scale),argument1,argument2,scale,scale,0)
    draw_text_transformed(argument0,argument1+(1*scale),argument2,scale,scale,0)
    draw_text_transformed(argument0,argument1-(1*scale),argument2,scale,scale,0)
}
draw_set_color(c_white)
draw_text_transformed(argument0,argument1,argument2,scale,scale,0)
texture_set_interpolation(false);
