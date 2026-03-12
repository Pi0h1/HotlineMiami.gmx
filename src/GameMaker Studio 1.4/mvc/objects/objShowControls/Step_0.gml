if wait>0 wait-=1
if global.xbox=1 {
if checkbutton(0,getid(6)) {
if pressback=0 {
pressback=1
scrXboxControlsBack()
} 
} else pressback=0


if leftthumb_x(0)>15000 {
if pressright=0 {
pressright=1
scrXboxControlsRight()
}
} else pressright=0

if leftthumb_x(0)<-15000 {
if pressleft=0 {
pressleft=1
scrXboxControlsLeft()
}
} else pressleft=0

}

if keyboard_check_pressed(ord(global.leftkey)) event_perform(ev_keypress,ord("A"))
if keyboard_check_pressed(ord(global.rightkey)) event_perform(ev_keypress,ord("D"))
upkey=global.upkey
downkey=global.downkey
leftkey=global.leftkey
rightkey=global.rightkey
upkey=string_replace(upkey,"&","up")
upkey=string_replace(upkey,"%","left")
upkey=string_replace(upkey,"'","right")
upkey=string_replace(upkey,"(","down")

downkey=string_replace(downkey,"&","up")
downkey=string_replace(downkey,"%","left")
downkey=string_replace(downkey,"'","right")
downkey=string_replace(downkey,"(","down")

leftkey=string_replace(leftkey,"&","up")
leftkey=string_replace(leftkey,"%","left")
leftkey=string_replace(leftkey,"'","right")
leftkey=string_replace(leftkey,"(","down")

rightkey=string_replace(rightkey,"&","up")
rightkey=string_replace(rightkey,"%","left")
rightkey=string_replace(rightkey,"'","right")
rightkey=string_replace(rightkey,"(","down")

if global.xbox=0 control[0]=upkey+", "+leftkey+", "+downkey+", "+rightkey
if global.xbox=0 control[14]=global.restartkey
surface_set_target(global.surf1)
draw_clear_alpha(c_black,0)
mapdir+=0.5

draw_set_font(fntMenu)
draw_set_halign(fa_center)
draw_set_valign(fa_center)
texts=7+lengthdir_x(15,dir*15)
if texts<1 texts=1 
if texts>22 texts=22
i=0
repeat (texts) {
draw_set_color(merge_color(merge_color(c_lime,c_yellow,0.5+lengthdir_x(0.5,dir*3.232)),c_white,i*(1/22)))
draw_text_transformed(room_width/2,room_height*0.28-i*0.5,string_hash_to_newline(move[select]),1+i*0.01,1+i*0.01,0)
i+=1
}
draw_set_color(merge_color(c_orange,c_white,0.5+lengthdir_x(0.5,dir*16)))
if edit=1 draw_set_color(merge_color(c_lime,c_white,0.5+lengthdir_x(0.5,dir*16)))
draw_text_transformed(room_width/2+1,room_height*0.67+1,string_hash_to_newline(control[select]),1,1,0)
draw_set_color(merge_color(c_orange,c_white,0.5-lengthdir_x(0.5,dir*16)))
if edit=1 draw_set_color(merge_color(c_lime,c_white,0.5+lengthdir_x(0.5,dir*16)))
draw_text_transformed(room_width/2,room_height*0.67,string_hash_to_newline(control[select]),1,1,0)
draw_set_color(merge_color(c_lime,c_white,0.5+lengthdir_x(0.5,dir*16)))
draw_text_transformed(room_width/2+1,room_height*0.75+1,string_hash_to_newline(condition[select]),1,1,0)
draw_set_color(merge_color(c_lime,c_white,0.5-lengthdir_x(0.5,dir*16)))
draw_text_transformed(room_width/2,room_height*0.75,string_hash_to_newline(condition[select]),1,1,0)
surface_reset_target()
