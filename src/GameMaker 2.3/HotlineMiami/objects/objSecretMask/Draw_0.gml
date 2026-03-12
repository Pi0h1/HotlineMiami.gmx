if instance_exists(objPlayer) {
if (point_distance(x,y,objPlayer.x,objPlayer.y)<24 or global.maskindex=1) {
draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,c_black,0.5)
draw_sprite_ext(sprite_index,image_index,x,y-abs(lengthdir_x(1.5,dir)),image_xscale,image_yscale,image_angle,image_blend,image_alpha)
d3d_set_fog(true,c_white,0,0)
draw_sprite_ext(sprite_index,1,x,y-abs(lengthdir_x(1.5,dir)),image_xscale,image_yscale,image_angle,image_blend,0.1+lengthdir_x(0.1,dir))
d3d_set_fog(0,0,0,0)
dir+=4
} else {
draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha)
}
} else {
draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha)
}
