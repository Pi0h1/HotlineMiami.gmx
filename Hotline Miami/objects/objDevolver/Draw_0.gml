texture_set_interpolation(true)
draw_sprite_ext(sprDevolver,0,room_width/2,room_height/2,1/3,1/3,0,c_white,1)
texture_set_interpolation(false)

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
if amount>0 amount-=10 else {
room_goto_next()
}
color1=merge_color(c_black,merge_color(c_aqua,c_white,0.5+lengthdir_x(0.5,amount)),0.5+lengthdir_x(0.5,amount))
if amount>90 color2=merge_color(c_black,merge_color(c_fuchsia,c_white,abs(lengthdir_y(1,amount))),abs(lengthdir_y(1,amount))) else color2=c_white
draw_set_blend_mode(bm_subtract)
draw_rectangle_color(-10,-10,__view_get( e__VW.WView, 0 )+10,__view_get( e__VW.HView, 0 )+10,color2,color1,color1,color2,0)
draw_set_blend_mode(bm_normal) 
}


draw_set_blend_mode(bm_subtract)
my_y=random(32)
draw_sprite_tiled(sprScanlines,0,0,my_y)
draw_circle_color(__view_get( e__VW.WView, 0 )/2,__view_get( e__VW.HView, 0 )/2,268+random(24),c_black,merge_color(c_navy,c_aqua,0.25+random(0.25)),0)
draw_set_blend_mode(bm_normal)

draw_set_color(c_black)
draw_rectangle(-10,-10,room_width+10,15,0)
draw_rectangle(-10,room_height-15,room_width+10,room_height+10,0)
