if sprite_index=last_sprite nothing=1 else {
scrUpdateMaskPos(sprite_index)
last_sprite=sprite_index
}

draw_sprite_ext(sprite_index,image_index,x+1,y+1,image_xscale,image_yscale,image_angle,c_black,0.5)
draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha)

if sprite_index=sprPClimbWindow {
scrDrawMask(1)
}
