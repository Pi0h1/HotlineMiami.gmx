if global.xbox=1 {
if checkbutton(0,getid(5)) {
if presstart=0 {
presstart=1
scrXboxWeaponUnlockStart()
} 
} else presstart=0
}

SteamRunCallbacks()
surface_set_target(global.surf1)
draw_clear_alpha(c_black,0)
i=0

draw_set_font(fntPointShow)
draw_set_halign(fa_center)
draw_set_valign(fa_center)
texts=7+lengthdir_x(15,dir*3)
if texts<1 texts=1 
if texts>22 texts=22
i=0
repeat (texts) {
draw_set_color(merge_color(merge_color(c_purple,c_fuchsia,0.5+lengthdir_x(0.5,dir*3.232)),c_white,i*(1/22)))
draw_text_transformed(room_width/2,room_height*0.15-i*0.5,string_hash_to_newline("NEW WEAPON"),1+i*0.01,1+i*0.01,0)
i+=1
}

texts=(7+lengthdir_x(15,dir*3-180))*factor
if texts<ceil(1*factor) texts=(1*factor) 
if texts>22 texts=22 
i=0
repeat (texts) {
draw_set_color(merge_color(merge_color(c_aqua,c_teal,0.5+lengthdir_x(0.5,dir*3.232)),c_white,i*(1/22)))
draw_text_transformed(room_width/2,room_height-room_height*0.15+i*0.5,string_hash_to_newline(gun[current]),1+i*0.01,1+i*0.01,0)
i+=1
}
surface_reset_target()
