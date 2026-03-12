if image_index=0 {
draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,c_black,0.5)
draw_sprite_ext(sprite_index,image_index,x-1+lengthdir_x(1,dir),y-1+lengthdir_x(1,dir),image_xscale,image_yscale,image_angle,image_blend,image_alpha)
d3d_set_fog(true,c_white,0,0)
if room=rmPhoneHomUpstairs draw_sprite_ext(sprite_index,image_index,x-1+lengthdir_x(1,dir),y-1+lengthdir_x(1,dir),image_xscale,image_yscale,image_angle,image_blend,0.1+lengthdir_x(0.1,dir))
d3d_set_fog(0,0,0,0)
if image_index=0 and room=rmPhoneHomUpstairs draw_sprite_ext(sprArrow,0,x,y-12+lengthdir_x(4,dir*2),1,1,0,c_white,1)
} else {
draw_sprite_ext(sprite_index,image_index,x+1,y+1,image_xscale,image_yscale,image_angle,c_black,0.5)
draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha)
}
if room=rmPhoneHomUpstairs dir+=4
