draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha)
draw_set_blend_mode(bm_add)
draw_sprite_ext(sprSignGlow,index,x,y,image_xscale,image_yscale,image_angle,merge_color(c_ltgray,c_white,random(1)),image_alpha)
index+=0.2
draw_set_blend_mode(bm_normal)
