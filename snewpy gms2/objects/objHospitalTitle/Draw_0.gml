dir+=0.25
color2=merge_color(c_yellow,c_white,0.7+lengthdir_x(0.3,dir*3))
color1=merge_color(c_yellow,merge_color(merge_color(c_red,c_orange,0.5+lengthdir_x(0.5,dir*3.12)),c_maroon,0.125+lengthdir_y(0.125,dir*1.73)),0.4+lengthdir_y(0.4,dir*24))
d3d_set_projection_ortho(0,0,camera_get_view_width(view_camera[0]),camera_get_view_height(view_camera[0]),0)
draw_rectangle_color(camera_get_view_x(view_camera[0]),camera_get_view_y(view_camera[0])+54,camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0]),camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])-64,color1,color1,color2,color2,0)
with objHouse draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha)
i=0
repeat (5) {
draw_sprite_ext(sprPalmTrees,palmindex[i],palmx[i],room_height+65,1,1,0,c_black,1)
palmx[i]-=12
if palmx[i]<=-60 {palmx[i]=room_width+60 palmindex[i]=floor(random(6))}
i+=1
}
d3d_set_projection_ortho(0,0,camera_get_view_width(view_camera[0]),camera_get_view_height(view_camera[0]),camera_get_view_angle(view_camera[0]))
draw_surface_ext(global.surf1,0,-1,1,1,0,c_black,1)
draw_surface_ext(global.surf1,-1,0,1,1,0,c_black,1)
draw_surface_ext(global.surf1,0,1,1,1,0,c_black,1)
draw_surface_ext(global.surf1,1,0,1,1,0,c_black,1)
draw_surface_ext(global.surf1,0,0,1,1,0,c_white,1)

camera_set_view_angle(view_camera[0], lengthdir_y(3,dir*3.33))

d3d_set_projection_ortho(0,0,camera_get_view_width(view_camera[0]),camera_get_view_height(view_camera[0]),0)
draw_set_color(c_black)
draw_rectangle(0,0,room_width,55,0)
draw_rectangle(0,room_height,room_width,room_height-65,0)
d3d_set_projection_ortho(0,0,camera_get_view_width(view_camera[0]),camera_get_view_height(view_camera[0]),0)
draw_set_font(fntDate)
draw_set_halign(fa_center)
draw_set_color(c_black)
draw_text(room_width/2,room_height-58-1,string_hash_to_newline(hint[myhint]))
draw_text(room_width/2,room_height-58+1,string_hash_to_newline(hint[myhint]))
draw_text(room_width/2-1,room_height-58,string_hash_to_newline(hint[myhint]))
draw_text(room_width/2+1,room_height-58,string_hash_to_newline(hint[myhint]))
draw_set_color(c_dkgray)
draw_text(room_width/2,room_height-58,string_hash_to_newline(hint[myhint]))

if fade=0 {
if c_amount<180 {
c_amount+=10
color1=merge_color(c_black,merge_color(c_aqua,c_white,0.5+lengthdir_x(0.5,c_amount)),0.5+lengthdir_x(0.5,c_amount))
if c_amount>90 color2=merge_color(c_black,merge_color(c_fuchsia,c_white,abs(lengthdir_y(1,c_amount))),abs(lengthdir_y(1,c_amount))) else color2=c_white
draw_set_blend_mode(bm_subtract)
draw_rectangle_color(camera_get_view_x(view_camera[0])-10,camera_get_view_y(view_camera[0])-10,camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])+10,camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])+10,color1,color2,color2,color1,0)
draw_set_blend_mode(bm_normal)
}
}

if fade=1 {
if c_amount>0  {
c_amount-=5
color1=merge_color(c_black,merge_color(c_aqua,c_white,0.5+lengthdir_x(0.5,c_amount)),0.5+lengthdir_x(0.5,c_amount))
if c_amount>90 color2=merge_color(c_black,merge_color(c_fuchsia,c_white,abs(lengthdir_y(1,c_amount))),abs(lengthdir_y(1,c_amount))) else color2=c_white
draw_set_blend_mode(bm_subtract)
draw_rectangle_color(camera_get_view_x(view_camera[0])-10,camera_get_view_y(view_camera[0])-10,camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])+10,camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])+10,color2,color1,color1,color2,0)
draw_set_blend_mode(bm_normal)
} else {room_goto(global.level) game_save("restart.dat")}
}


draw_set_blend_mode(bm_subtract)
my_y=random(32)
draw_sprite_tiled(sprScanlines,0,0,my_y)
draw_set_blend_mode(bm_subtract)
draw_circle_color(camera_get_view_width(view_camera[0])/2,camera_get_view_height(view_camera[0])/2,240+random(24),c_black,merge_color(c_navy,c_aqua,0.25+random(0.25)),0)
draw_set_blend_mode(bm_normal)

