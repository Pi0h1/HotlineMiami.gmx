if global.xbox=1 {

if checkbutton(0,getid(5)) {
if presstart=0 {
presstart=1
scrXboxLevelSelectStart()
}
} else presstart=0

if checkbutton(0,getid(6)) {
if pressback=0 {
pressback=1
scrXboxLevelSelectBack()
} 
} else pressback=0

if leftthumb_x(0)>15000 {
if pressright=0 {
pressright=1
scrXboxLevelSelectRight()
}
} else pressright=0

if leftthumb_x(0)<-15000 {
if pressleft=0 {
pressleft=1
scrXboxLevelSelectLeft()
}
} else pressleft=0

if leftthumb_y(0)>5000 {
if pressup=0 {
pressup=1
scrXboxLevelSelectUp()
}
} else pressup=0

if leftthumb_y(0)<-5000 {
if pressdown=0 {
pressdown=1
scrXboxLevelSelectDown()
}
} else pressdown=0

}

if wait>0 wait-=1
if keyboard_check_pressed(ord(global.upkey)) event_perform(ev_keypress,ord("W"))
if keyboard_check_pressed(ord(global.downkey)) event_perform(ev_keypress,ord("S"))
if keyboard_check_pressed(ord(global.leftkey)) event_perform(ev_keypress,ord("A"))
if keyboard_check_pressed(ord(global.rightkey)) event_perform(ev_keypress,ord("D"))




if !surface_exists(global.surf1) {
global.surf1=surface_create(camera_get_view_width(view_camera[0]),camera_get_view_height(view_camera[0]))
surface_set_target(global.surf1)
draw_clear_alpha(c_black,0)
surface_reset_target()
}
surface_set_target(global.surf1)
draw_clear_alpha(c_black,0)
i=0
if myrepeats<repeats myrepeats+=0.25
if myrepeats>repeats myrepeats-=0.25
dist=point_distance(x,y,mouse_x,mouse_y)*0.01
if dist>1 dist=1
if state=1 {if addx>-96 addx-=8} else {if addx<0 addx+=8}
repeat (myrepeats) {
if title[select]="LOCKED" color=merge_color(c_dkgray,c_black,i*(1/sprite_get_number(sprite_index))) else color=merge_color(merge_color(c_aqua,c_fuchsia,0.5+lengthdir_x(0.5,dir*3.12)),c_white,i*(1/sprite_get_number(sprite_index)))
draw_sprite_ext(sprite_index,i,x+addx*0.75,y-i*0.6,1+i*0.01,1+i*0.01,mapdir,color,1) 
i+=1
}
mapdir+=0.5

if addx<0 {
if global.highscore[select]>0 {
draw_set_font(fntDate)
draw_set_halign(fa_center)
draw_set_valign(fa_top)
draw_set_color(c_yellow)
draw_text(400+180+addx*3.3,92,string_hash_to_newline("HIGHSCORE:"))
draw_set_color(c_white)
draw_text(400+180+addx*3.3+string_width(string_hash_to_newline("HIGHSCORE: "))*0.5+string_width(string_hash_to_newline(string(global.highscore[select])))*0.5,92,string_hash_to_newline(string(global.highscore[select])))
draw_set_font(fntDate)
draw_set_color(c_lime)
draw_text(400+180+addx*3.3,106,string_hash_to_newline("GRADE:    "))
draw_set_font(fntGradeSmall)
draw_set_color(c_red)
draw_text(400+202+addx*3.3,93,string_hash_to_newline(scrNumberToGrade(global.grade[select])))
} else {
draw_set_font(fntDate)
draw_set_halign(fa_center)
draw_set_valign(fa_top)
draw_set_color(c_yellow)
draw_text(400+180+addx*3.3,92,string_hash_to_newline("HIGHSCORE:"))
draw_set_color(c_white)
draw_text(400+180+addx*3.3+string_width(string_hash_to_newline("HIGHSCORE: "))*0.5+string_width(string_hash_to_newline("-"))*0.5,92,string_hash_to_newline("-"))
draw_set_font(fntDate)
draw_set_color(c_lime)
draw_text(400+180+addx*3.3,106,string_hash_to_newline("GRADE:    "))
draw_set_font(fntGradeSmall)
draw_set_color(c_red)
draw_text(400+202+addx*3.3,93,string_hash_to_newline("-"))
}

draw_set_font(fntDate)
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_set_color(c_yellow)
draw_text(400+180+addx*3.3-string_width(string_hash_to_newline("GRADE:    "))*0.5,140,string_hash_to_newline("START WITH INTRO:"))
if intro=1 draw_set_color(c_white) else draw_set_color(c_gray)
draw_text(400+180+addx*3.3-string_width(string_hash_to_newline("GRADE:    "))*0.5,150,string_hash_to_newline("YES"))
draw_set_color(c_gray)
draw_text(400+180+addx*3.3-string_width(string_hash_to_newline("GRADE:    "))*0.5+string_width(string_hash_to_newline("YES")),150,string_hash_to_newline("/"))
if intro=0 draw_set_color(c_white) else draw_set_color(c_gray)
draw_text(400+180+addx*3.3-string_width(string_hash_to_newline("GRADE:    "))*0.5+string_width(string_hash_to_newline("YES/")),150,string_hash_to_newline("NO"))

}

draw_set_font(fntMenu)
draw_set_halign(fa_center)
draw_set_valign(fa_center)
texts=7+lengthdir_x(15,dir*15)
if texts<1 texts=1 
if texts>22 texts=22
i=0
repeat (texts) {
draw_set_color(merge_color(merge_color(c_lime,c_yellow,0.5+lengthdir_x(0.5,dir*3.232)),c_white,i*(1/22)))
draw_text_transformed(room_width/2,room_height*0.28-i*0.5,string_hash_to_newline(chapter[select]),1+i*0.01,1+i*0.01,0)
i+=1
}

texts=7+lengthdir_x(15,dir*15-180)
if texts<1 texts=1 
if texts>22 texts=22
i=0
repeat (texts) {
draw_set_color(merge_color(merge_color(c_aqua,c_fuchsia,0.5+lengthdir_x(0.5,dir*3.232)),c_white,i*(1/22)))
draw_text_transformed(room_width/2,room_height-room_height*0.28+i*0.5,string_hash_to_newline(title[select]),1+i*0.01,1+i*0.01,0)
i+=1
}
surface_alpha()
surface_reset_target()
