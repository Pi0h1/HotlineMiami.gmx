if instance_exists(objPlayer) {
if point_distance(x,y,objPlayer.x,objPlayer.y)<32 or global.maskindex==1 {
draw_sprite_ext(sprite_index,image_index,x,y+abs(lengthdir_x(1.5,dir)),image_xscale,image_yscale,image_angle,image_blend,image_alpha)
dir+=4
} else {
draw_sprite_ext(sprite_index,0,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha)
}
} else {
draw_sprite_ext(sprite_index,0,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha)
}
