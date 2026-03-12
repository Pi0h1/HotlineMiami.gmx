if light>0 light-=1
draw_set_blend_mode(bm_add)
draw_circle_color(x,y,48+random(6)+light,make_color_hsv(0,0,30),c_black,0)
draw_set_blend_mode(bm_normal)
draw_sprite_ext(sprite_index,image_index,x+1,y+1,image_xscale,image_yscale,direction,c_black,0.5)
draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,direction,image_blend,image_alpha)
draw_set_color(c_white)
//draw_path(my_path,0,0,1)
