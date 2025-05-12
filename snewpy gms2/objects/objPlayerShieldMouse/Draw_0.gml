if persistent=1 exit
if sprite_index=last_sprite nothing=1 else {
scrUpdateMaskPos(sprite_index)
last_sprite=sprite_index
}
left=1
draw_set_blend_mode(bm_add)
lastdir=dir
dir=scrRotate(dir,point_direction(x,y,global.mousex,global.mousey),6)
draw_circle_color(x,y,48+random(6)+light,make_color_hsv(0,0,30+light*2),c_black,0)
draw_set_blend_mode(bm_normal)
draw_sprite_ext(sprLegs,legindex,x+1,y+1,image_xscale,image_yscale,legdir,c_black,0.5)
draw_sprite_ext(sprLegs,legindex2,x+lengthdir_x(7,dir-45)+1,y+lengthdir_y(7,dir-45)+1,image_xscale,image_yscale,legdir,c_black,0.5)
draw_sprite_ext(sprite_index,image_index,x+1,y+1,image_xscale,image_yscale*left,dir,c_black,0.5)
draw_sprite_ext(sprLegs,legindex,x,y,image_xscale,image_yscale,legdir,image_blend,image_alpha)
draw_sprite_ext(sprLegs,legindex2,x+lengthdir_x(7,dir-45),y+lengthdir_y(7,dir-45),image_xscale,image_yscale,legdir,image_blend,image_alpha)
if dir=lastdir or energie<9 nothing=1 else legindex2+=0.05
draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale*left,dir,image_blend,image_alpha)
if reload>0 reload-=1
if light>3 light-=3
if maskon=1 scrDrawMask(0)
