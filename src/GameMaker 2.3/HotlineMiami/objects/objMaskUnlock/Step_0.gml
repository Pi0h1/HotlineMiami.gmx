if global.xbox=1 {
if checkbutton(0,getid(5)) {
if presstart=0 {
presstart=1
scrXboxMaskUnlockStart()
} 
} else presstart=0
}
SteamRunCallbacks()
if !surface_exists(global.surf1) {
global.surf1=surface_create(room_width,room_height)
surface_set_target(global.surf1)
draw_clear_alpha(c_black,0)
surface_reset_target()
}
surface_set_target(global.surf1)
draw_clear_alpha(c_black,0)
draw_set_font(fntUnlock)
draw_set_halign(fa_center)
draw_set_valign(fa_center)
draws=16+lengthdir_x(10,dir*8)
if draws<=2 draws=2
i=0
add=6+lengthdir_x(6,maskamount)
if on=0 {text="NEW MASK" color=merge_color(c_maroon,c_purple,0.2+lengthdir_x(0.2,dir*3.33))+random(0.1)} else {text=name[global.currentmask] color=merge_color(c_teal,c_navy,0.2+lengthdir_x(0.2,dir*3.33)+random(0.1))}
repeat (draws)
{
draw_set_color(merge_color(color,c_white,i*(1/draws)))
draw_text_transformed(room_width/2-draws*0.5+i,room_height*0.75+add+i*0.5,string_hash_to_newline(text),0.9+i*0.01,0.9+i*0.03,lengthdir_x(3,dir*6))
i+=1
}
surface_reset_target()
