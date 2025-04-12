draw_set_font(fntQuestion)
draw_set_valign(fa_center)
draw_set_halign(fa_center)
draw_set_color(merge_color(c_orange,c_red,0.5+lengthdir_x(0.5,dir*5)))
draw_text(room_width/2,room_height/2-20,string_hash_to_newline("ENABLE#STEAMWORKS?"))
draw_set_color(merge_color(c_orange,c_red,0.5+lengthdir_x(0.5,dir*5-45)))
draw_text(room_width/2-1,room_height/2-21,string_hash_to_newline("ENABLE#STEAMWORKS?"))
draw_set_color(merge_color(c_orange,c_red,0.5+lengthdir_x(0.5,dir*5-90)))
draw_text(room_width/2-2,room_height/2-22,string_hash_to_newline("ENABLE#STEAMWORKS?"))
draw_set_font(fntAnswers)
if select=0 draw_set_color(merge_color(c_red,c_fuchsia,0.5+lengthdir_x(0.5,dir))) else draw_set_color(merge_color(c_maroon,c_purple,0.5+lengthdir_x(0.5,dir)))
draw_text(room_width/2-60+2,room_height/2+16+2,string_hash_to_newline("YES"))
if select=0 {draw_set_color(c_white) dir1+=4} else {draw_set_color(c_ltgray) dir1=180}
draw_text(room_width/2-60-lengthdir_x(1,dir1),room_height/2+16-lengthdir_x(1,dir1),string_hash_to_newline("YES"))
if select=1 draw_set_color(merge_color(c_red,c_fuchsia,0.5+lengthdir_x(0.5,dir))) else draw_set_color(merge_color(c_maroon,c_purple,0.5+lengthdir_x(0.5,dir)))
draw_text(room_width/2+60+2,room_height/2+16+2,string_hash_to_newline("NO"))
if select=1 {draw_set_color(c_white) dir2+=4} else {draw_set_color(c_ltgray) dir2=180}
draw_text(room_width/2+60-lengthdir_x(1,dir2),room_height/2+16-lengthdir_x(1,dir2),string_hash_to_newline("NO"))

__view_set( e__VW.Angle, 0, lengthdir_x(2,dir) )
dir+=1

d3d_set_projection_ortho(0,0,400,256,0)
draw_set_font(fntDate)
draw_set_color(c_dkgray)
draw_text(room_width/2+1,room_height*0.8+1,string_hash_to_newline(disclaimer))
draw_set_color(c_white)
draw_text(room_width/2,room_height*0.8,string_hash_to_newline(disclaimer))


if fade=0 {
if amount<180 {
amount+=5
color1=merge_color(c_black,merge_color(c_aqua,c_white,0.5+lengthdir_x(0.5,amount)),0.5+lengthdir_x(0.5,amount))
if amount>90 color2=merge_color(c_black,merge_color(c_fuchsia,c_white,abs(lengthdir_y(1,amount))),abs(lengthdir_y(1,amount))) else color2=c_white
draw_set_blend_mode(bm_subtract)
draw_rectangle_color(-10,-10,__view_get( e__VW.WView, 0 )+10,__view_get( e__VW.HView, 0 )+10,color1,color2,color2,color1,0)
draw_set_blend_mode(bm_normal)
}
}

if fade=1 {
if amount>0  {
amount-=10
color1=merge_color(c_black,merge_color(c_aqua,c_white,0.5+lengthdir_x(0.5,amount)),0.5+lengthdir_x(0.5,amount))
if amount>90 color2=merge_color(c_black,merge_color(c_fuchsia,c_white,abs(lengthdir_y(1,amount))),abs(lengthdir_y(1,amount))) else color2=c_white
draw_set_blend_mode(bm_subtract)
draw_rectangle_color(-10,-10,__view_get( e__VW.WView, 0 )+10,__view_get( e__VW.HView, 0 )+10,color2,color1,color1,color2,0)
draw_set_blend_mode(bm_normal)
} else {if select=0 {
steamdll_init() SteamInit() global.steamon=1 file=file_text_open_write(working_directory+"\\steamon") file_text_close(file)} else {
global.steamon=0 file=file_text_open_write(working_directory+"\\steamoff") file_text_close(file)} room_goto_next()}
}
