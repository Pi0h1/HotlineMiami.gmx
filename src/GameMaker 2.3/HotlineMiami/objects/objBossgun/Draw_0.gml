if room=rmMansionMainHall {
draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,c_black,0.5)
draw_sprite_ext(sprite_index,image_index,x-1+lengthdir_x(1,dir),y-1+lengthdir_x(1,dir),image_xscale,image_yscale,image_angle,image_blend,image_alpha)
d3d_set_fog(true,c_white,0,0)
draw_sprite_ext(sprite_index,image_index,x-1+lengthdir_x(1,dir),y-1+lengthdir_x(1,dir),image_xscale,image_yscale,image_angle,image_blend,0.1+lengthdir_x(0.1,dir))
d3d_set_fog(0,0,0,0)
if objBossPhone.talked=1 {
draw_sprite(sprArrow,0,x,y-16+lengthdir_x(3,dir))
dir+=8
}

} else {
draw_sprite_ext(sprite_index,image_index,x+1,y+1,image_xscale,image_yscale,image_angle,c_black,0.5)
draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha)
}
