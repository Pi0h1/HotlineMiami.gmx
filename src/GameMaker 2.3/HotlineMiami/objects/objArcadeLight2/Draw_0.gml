dir+=4
h+=0.25
if h>255 h-=255
image_blend=make_color_hsv(h,150,180+lengthdir_x(30,dir))
draw_set_blend_mode(bm_add)
draw_sprite_ext(sprite_index,0,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha)
draw_set_blend_mode(bm_subtract)
draw_sprite_ext(sprite_index,1,x,y,image_xscale,image_yscale,image_angle,c_white,image_alpha)
draw_set_blend_mode(bm_normal)
