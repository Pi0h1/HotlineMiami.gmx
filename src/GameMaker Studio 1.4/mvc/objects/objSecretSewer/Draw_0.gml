draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha)
if open=0 draw_sprite_ext(sprSecretSewerGrate,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha)
if !instance_exists(objPlayerMouse) or global.done=0 exit
if enter=0 {
if objPlayer.sprite_index=sprPWalkCrowbar {
draw_sprite_ext(sprArrow,0,x+24+lengthdir_x(3,dir),y,image_xscale,image_yscale,270,image_blend,image_alpha)
dir+=4
}
}
