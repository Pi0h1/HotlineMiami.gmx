if hurtindex<targetindex hurtindex+=0.25
image_yscale=1
draw_sprite_ext(sprBoss2Clubbed,hurtindex,x+1,y+1,image_xscale,image_yscale,image_angle,c_black,0.5)
draw_sprite_ext(sprite_index,image_index,x+1,y+1,image_xscale,image_yscale,image_angle,c_black,0.5)
draw_sprite_ext(sprBoss2Clubbed,hurtindex,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha)
draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha)
scrDrawMask(1)
