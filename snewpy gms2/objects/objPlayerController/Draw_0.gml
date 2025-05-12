draw_set_blend_mode(bm_add)
draw_circle_color(x,y,48+random(6)+light,make_color_hsv(0,0,30+light*2),c_black,0)
draw_set_blend_mode(bm_normal)
draw_sprite_ext(sprLegs,legindex,x+1,y+1,image_xscale,image_yscale,legdir,c_black,0.5)
draw_sprite_ext(sprite_index,image_index,x+1,y+1,image_xscale,image_yscale*left,dir,c_black,0.5)
draw_sprite_ext(sprLegs,legindex,x,y,image_xscale,image_yscale,legdir,image_blend,image_alpha)
draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale*left,dir,image_blend,image_alpha)
if reload>0 reload-=1
if light>3 light-=3 else light=0
if sprite_index=sprPWalkThrow {
left=1
draw_sprite_ext(sprThrowWeapons,throwindex,x+lengthdir_x(throwadd[floor(image_index)],dir-180)+lengthdir_x(8,dir-90)+1,y+1+lengthdir_y(throwadd[floor(image_index)],dir-180)+lengthdir_y(8,dir-90),image_xscale,image_yscale,dir+(image_index-3)*5,c_black,0.5)
draw_sprite_ext(sprThrowWeapons,throwindex,x+lengthdir_x(throwadd[floor(image_index)],dir-180)+lengthdir_x(8,dir-90),y+lengthdir_y(throwadd[floor(image_index)],dir-180)+lengthdir_y(8,dir-90),image_xscale,image_yscale,dir+lengthdir_x(20,360*(image_index*(1/8))),image_blend,image_alpha)
}

draw_sprite_ext(sprAim,0,x+lengthdir_x(32,dir),y+lengthdir_y(32,dir),1,1,-camera_get_view_angle(view_camera[0]),c_white,0.5)
draw_sprite_ext(sprCursor,objEffector.image_index,x+lengthdir_x(64,dir),y+lengthdir_y(64,dir),1,1,-camera_get_view_angle(view_camera[0]),c_white,0.5)
