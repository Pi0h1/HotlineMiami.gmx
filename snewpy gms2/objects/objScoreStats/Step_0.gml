if global.xbox=1 {
fastforward=0
if checkbutton(0,getid(5)) {
if presstart=0 {
presstart=1
scrXboxScoreStatsStart()
} else {fastforward=1}
} else presstart=0
} else {
fastforward=mouse_check_button(mb_left)
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
draw_set_font(fntPointShow)
draw_set_halign(fa_center)
draw_set_valign(fa_center)
i=0
repeat (6) {
start_x=60+string_width(string_hash_to_newline(type[i]))*0.5
if i<current+1 {
ii=0
repeat (1+abs(lengthdir_y(15,amount[i]))) {
draw_set_color(merge_color(merge_color(c_purple,c_fuchsia,0.5-lengthdir_y(0.5,dir*8+i*25)),merge_color(c_white,c_yellow,0.25-lengthdir_y(0.25,dir*12+i*25)),0.5-lengthdir_x(0.5,ii*(180/16))))
dist=((64+i*16)-(room_height/2))*0.25
draw_text_transformed(start_x,64+i*16-lengthdir_y(dist,45-lengthdir_x(45,ii*(180/16))),string_hash_to_newline(type[i]),1+abs(lengthdir_y(0.25,45-lengthdir_x(45,ii*(180/16)))),1+abs(lengthdir_y(1,45-lengthdir_x(45,ii*(180/16)))),0)
ii+=1
}
if amount[i]<180 amount[i]+=4+fastforward*6 else {
if fastforward drawbonus[i]=bonus[i]
if drawbonus[i]<bonus[i]-200 drawbonus[i]+=100 else {
if drawbonus[i]<bonus[i]-100 drawbonus[i]+=10 else {
if drawbonus[i]<bonus[i]-5 drawbonus[i]+=5 else drawbonus[i]=bonus[i]
}
}
draw_set_halign(fa_right)
draw_set_color(merge_color(c_teal,c_black,0.35+lengthdir_x(0.35,dir*24)))
draw_text_transformed(334,64+i*16,string_hash_to_newline(string(drawbonus[i])),1,1,0)
draw_set_color(merge_color(c_aqua,c_teal,0.35+lengthdir_x(0.35,dir*24)))
draw_text_transformed(332,64+i*16,string_hash_to_newline(string(drawbonus[i])),1,1,0)
draw_set_color(c_white)
draw_text_transformed(330,64+i*16,string_hash_to_newline(string(drawbonus[i])),1,1,0)
draw_set_halign(fa_center)
if current=i and drawbonus[i]=bonus[i] current+=1
}
}
i+=1
}
if drawbonus[5]=bonus[5] {
if factor<1 factor+=0.025
draw_set_halign(fa_center)
draw_set_font(fntChapter)
i=0 
times=lengthdir_x(11,dir*15)
if times<1 times=1
if global.myscore<real(string_digits(parscore)) color1=c_red else color1=c_lime
repeat (times) {
draw_set_color(merge_color(color1,c_white,0.5-lengthdir_x(0.5,i*16)))
draw_text_transformed(200,camera_get_view_height(view_camera[0])-64,string_hash_to_newline(string(global.myscore)+parscore),0.65+i*0.005,1+i*0.05,lengthdir_x(4,dir*8))
i+=1
}
}
surface_reset_target()
