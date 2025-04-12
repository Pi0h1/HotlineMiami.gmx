//Ignore.
if coldir<180 coldir+=2
if coldir<90 coldir+=3

//Change these values
if coldir<=90 color=merge_color(c_black,merge_color(c_white,c_fuchsia,abs(lengthdir_y(1,coldir))),abs(lengthdir_y(1,coldir)))
if coldir>90 color=merge_color(c_fuchsia,c_aqua,abs(lengthdir_x(1,coldir)))
dir+=0.25

//''Color2'' is the main background
color2=c_black

//''Color1'' and ''Color3'' are both merger colours
color1=merge_color(c_black,merge_color(merge_color(c_fuchsia,c_aqua,0.5+lengthdir_x(0.5,dir*3.12)),c_red,0.125+lengthdir_y(0.125,dir*1.73)),0.75+lengthdir_y(0.25,dir*1.73))
global.color3=merge_color(merge_color(merge_color(c_blue,c_red,0.5+lengthdir_x(0.5,dir*3.12)),c_yellow,0.125+lengthdir_y(0.125,dir*1.73)),merge_color(c_white,c_fuchsia,0.5+lengthdir_x(0.3,dir)),0.5+lengthdir_x(0.5,dir*2.33))

draw_rectangle_color(-20,-20,room_width+20,room_height+20,color1,color1,color2,color2,0)
i=0
draw_set_blend_mode(bm_add)

//Sets the size of the palm trees
with objPalmTree {
draw_sprite_general(sprPalmTrees,image_index,0,0,82,256,room_width/2+amount,room_height*0.7-(320*(amount/240)),amount/240,(amount/120),0,global.color3,global.color3,c_black,c_black,1)
draw_sprite_general(sprPalmTrees,image_index,0,0,82,256,room_width/2-amount-(amount/240)*82,room_height*0.7-(320*(amount/240)),-amount/240,amount/120,0,global.color3,global.color3,c_black,c_black,1)
}

draw_set_blend_mode(bm_normal)
if surface_exists(global.surf1) {
draw_surface_ext(global.surf1,-1,0,1,1,0,c_black,1)
draw_surface_ext(global.surf1,0,1,1,1,0,c_black,1)
draw_surface_ext(global.surf1,0,-1,1,1,0,c_black,1)
draw_surface_ext(global.surf1,1,0,1,1,0,c_black,1)
draw_surface_ext(global.surf1,2,2,1,1,0,c_black,0.5)
draw_surface_ext(global.surf1,0,0,1,1,0,c_white,1)
} else {
draw_set_font(fntScore) 
draw_set_valign(fa_top)
draw_set_halign(fa_center)
draw_set_color(c_black)
draw_text(x-1,y,string_hash_to_newline("YOUR SYSTEM IS#OUT OF VIDEO MEMORY#PLEASE RESTART THE GAME!"))
draw_text(x+1,y,string_hash_to_newline("YOUR SYSTEM IS#OUT OF VIDEO MEMORY#PLEASE RESTART THE GAME!"))
draw_text(x,y+1,string_hash_to_newline("YOUR SYSTEM IS#OUT OF VIDEO MEMORY#PLEASE RESTART THE GAME!"))
draw_text(x,y-1,string_hash_to_newline("YOUR SYSTEM IS#OUT OF VIDEO MEMORY#PLEASE RESTART THE GAME!"))
draw_set_color(c_white)
draw_text(x,y,string_hash_to_newline("YOUR SYSTEM IS#OUT OF VIDEO MEMORY#PLEASE RESTART THE GAME!"))
}
__view_set( e__VW.Angle, 0, lengthdir_y(3,dir*3.33) )

//Transition between rooms
if fade=0 {
if c_amount<180 {
c_amount+=10
color1=merge_color(c_black,merge_color(c_aqua,c_white,0.5+lengthdir_x(0.5,c_amount)),0.5+lengthdir_x(0.5,c_amount))
if c_amount>90 color2=merge_color(c_black,merge_color(c_fuchsia,c_white,abs(lengthdir_y(1,c_amount))),abs(lengthdir_y(1,c_amount))) else color2=c_white
draw_set_blend_mode(bm_subtract)
draw_rectangle_color(camera_get_view_x(view_camera[0])-10,camera_get_view_y(view_camera[0])-10,camera_get_view_x(view_camera[0])+__view_get( e__VW.WView, 0 )+10,camera_get_view_y(view_camera[0])+__view_get( e__VW.HView, 0 )+10,color1,color2,color2,color1,0)
draw_set_blend_mode(bm_normal)
}
}

if fade=1 {
if c_amount>0  {
c_amount-=5
if select=0 sxeasy_setVolume(c_amount*(1/180))
color1=merge_color(c_black,merge_color(c_aqua,c_white,0.5+lengthdir_x(0.5,c_amount)),0.5+lengthdir_x(0.5,c_amount))
if c_amount>90 color2=merge_color(c_black,merge_color(c_fuchsia,c_white,abs(lengthdir_y(1,c_amount))),abs(lengthdir_y(1,c_amount))) else color2=c_white
draw_set_blend_mode(bm_subtract)
draw_rectangle_color(camera_get_view_x(view_camera[0])-10,camera_get_view_y(view_camera[0])-10,camera_get_view_x(view_camera[0])+__view_get( e__VW.WView, 0 )+10,camera_get_view_y(view_camera[0])+__view_get( e__VW.HView, 0 )+10,color2,color1,color1,color2,0)
draw_set_blend_mode(bm_normal)
} else {  {if select=0 {//global.sequence=rmSequence1 
sxeasy_stop() sxeasy_setVolume(0) //sxeasy_play(working_directory+"\ItsSafeNow.mp3") 
sxeasy_play(working_directory+"\\Static.mp3")
room=nextlevel} if select=1 and level=1 room=rmControls//sxeasy_play(working_directory+choose("\Knock.mp3","\InnerAnimal.mp3","\Hotline.mp3","\Hydrogen.mp3","\Crystals.mp3")) room=rmChapter
if select=1 and level=0 room=rmLevelSelect if select=3 room=rmBandCredits
}
}
}

d3d_set_projection_ortho(0,0,__view_get( e__VW.WView, 0 ),__view_get( e__VW.HView, 0 ),0)

draw_set_color(c_black)
draw_rectangle(-1,-1,room_width+1,15,0)
draw_rectangle(-1,room_height+1,room_width+1,room_height-15,0)

draw_set_color(c_white)
draw_set_font(fntDate)

draw_set_blend_mode(bm_subtract)
my_y=random(32)
draw_sprite_tiled(sprScanlines,0,0,my_y)
draw_set_blend_mode(bm_subtract)
draw_circle_color(__view_get( e__VW.WView, 0 )/2,__view_get( e__VW.HView, 0 )/2,240+random(24)+24,c_black,merge_color(c_navy,c_aqua,0.25+random(0.25)),0)
draw_set_blend_mode(bm_normal)
