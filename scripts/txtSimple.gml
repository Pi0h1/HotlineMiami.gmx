/// txtSimple(x,y,string,font,outline)
/// txtSimple(x,y,text_WarningRAM,fntScore,true)
var outline = argument4;
draw_set_font(argument3) 
draw_set_valign(fa_top)
draw_set_halign(fa_center)

if (outline){
    draw_set_color(c_black)
    draw_text(argument0-1,argument1,argument2    )
    draw_text(argument0+1,argument1,argument2    )
    draw_text(argument0,argument1+1,argument2    )
    draw_text(argument0,argument1-1,argument2    )
}
draw_set_color(c_white)
draw_text(argument0,argument1,argument2    )
