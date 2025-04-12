if instance_exists(objBoss1Die) active=1
draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,c_black,0.5)
draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha)
if state=2 draw_sprite_ext(sprArrow,0,x-20+lengthdir_x(4,dir),y,1,1,90,c_white,1)
dir+=8
