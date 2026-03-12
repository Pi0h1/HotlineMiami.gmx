if reload>0 reload-=1
draw_sprite_ext(sprite_index,image_index,x+1,y+1,image_xscale,image_yscale,image_angle,c_black,0.5)
draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha)

draw_sprite_ext(sprArrow,0,x-12+lengthdir_x(3,dir),y,1,1,90,image_blend,image_alpha)
dir+=4

