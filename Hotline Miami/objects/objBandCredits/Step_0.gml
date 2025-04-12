if global.xbox=1 {
if checkbutton(0,getid(5)) or checkbutton(0,getid(6)) {
if presstart=0 {
presstart=1
scrXboxBandCreditsStart()
} 
} else presstart=0
}

if !surface_exists(global.surf1) {
global.surf1=surface_create(room_width,room_height)
surface_set_target(global.surf1)
draw_clear_alpha(c_black,0)
surface_reset_target()
}

surface_set_target(global.surf1)
draw_clear_alpha(c_black,0)
draw_set_font(fntCredits)
draw_set_halign(fa_center)
draw_set_valign(fa_center)
//if i<0 or current>6 title="" else 
title="FEATURES MUSIC BY"
if i<=0 addx=abs(i*10)
if current>8 {if i*10>addx addx=i*10}
draw_set_color(merge_color(c_red,merge_color(c_maroon,c_black,0.5+lengthdir_x(0.5,dir*3.26)),0.5+lengthdir_x(0.5,dir*1.5)))
draw_text(room_width/2-addx,room_height*0.35-16,string_hash_to_newline(title))
draw_set_color(merge_color(c_red,merge_color(c_maroon,c_black,0.5+lengthdir_x(0.5,dir*3.26)),0.5+lengthdir_x(0.5,dir*1.5+90)))
draw_text(room_width/2+1+addx,room_height*0.35+1-16,string_hash_to_newline(title))
draw_set_font(fntBands)
draw_set_valign(fa_top)
draw_set_halign(fa_center)
dir+=4
if i<80 i+=1 else {current+=1 i=1}
if current<9 {
times=i
if times>20 times=20
if i>60 times=80-i
start=i-20
if start<0 start=0
ii=0
start_x=room_width/2-string_width(string_hash_to_newline(band[current]))/2
repeat (string_length(band[current])) {
letter=string_copy(band[current],ii+1,1)
mydir=point_direction(room_width/2,room_height,start_x+string_width(string_hash_to_newline(letter))*0.5,room_height/2)
iii=0
//if ii=0 start_x+=string_width(letter)*0.5
repeat (times) {
draw_set_color(merge_color(c_red,c_white,(start+iii)*(1/80)))
draw_text_transformed(start_x+lengthdir_x((start+iii),mydir)+string_width(string_hash_to_newline(letter))*0.5,room_height/2-16+lengthdir_y((start+iii)*0.6,mydir),string_hash_to_newline(letter),1+(start+iii)*0.005,1+(start+iii)*0.01,(mydir-90)*((start+iii)*0.005))
iii+=1
}
start_x+=string_width(string_hash_to_newline(letter))
ii+=1
}
}
surface_reset_target()
