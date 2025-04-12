if sprite_index=sprPTakePhone {
if !instance_exists(objPhoneConversation) sprite_index=sprPWalkUnarmed else {
if image_index<3 image_index+=0.15
}
}
if persistent=1 exit
if sprite_index=last_sprite nothing=1 else {
scrUpdateMaskPos(sprite_index)
last_sprite=sprite_index
}
draw_set_blend_mode(bm_add)
draw_circle_color(x,y,48+random(6)+light,make_color_hsv(0,0,30+light*2),c_black,0)
draw_set_blend_mode(bm_normal)
if myspeed=2.25 legsprite=sprLegsStairs else legsprite=sprLegs
if sprite_index=sprPWalkHospital legsprite=sprLegsHospital
if aimon=1 {
dir=point_direction(x,y,global.mousex,global.mousey)
if global.xbox=1 {
if active=1 dir=scrXboxPlayerLook() else {
if point_distance(x,y,previousx,previousy)>0.1 dir=point_direction(previousx,previousy,x,y)
}
}

}
if sprite_index=sprPUnlockDoor dir=90
draw_sprite_ext(legsprite,legindex,x+1,y+1,image_xscale,image_yscale,legdir,c_black,0.5)
draw_sprite_ext(sprite_index,image_index,x+1,y+1,image_xscale,image_yscale*left,dir,c_black,0.5)
draw_sprite_ext(legsprite,legindex,x,y,image_xscale,image_yscale,legdir,image_blend,image_alpha)
draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale*left,dir,image_blend,image_alpha)
if reload>0 reload-=1
if light>3 light-=3
if sprite_index=sprPWalkThrow {
left=1
draw_sprite_ext(sprThrowWeapons,throwindex,x+lengthdir_x(throwadd[floor(image_index)],dir-180)+lengthdir_x(8,dir-90)+1,y+1+lengthdir_y(throwadd[floor(image_index)],dir-180)+lengthdir_y(8,dir-90),image_xscale,image_yscale,dir+(image_index-3)*5,c_black,0.5)
draw_sprite_ext(sprThrowWeapons,throwindex,x+lengthdir_x(throwadd[floor(image_index)],dir-180)+lengthdir_x(8,dir-90),y+lengthdir_y(throwadd[floor(image_index)],dir-180)+lengthdir_y(8,dir-90),image_xscale,image_yscale,dir+lengthdir_x(20,360*(image_index*(1/8))),image_blend,image_alpha)
}
//scrDrawMask(set yscale and direction)
if maskon=1 scrDrawMask(0)
if sprite_index=sprPThrowMask {
if image_index<3 scrDrawMask(0)
if image_index>=3 and image_index<4 draw_sprite_ext(sprMaskDropBack,global.maskindex,x+lengthdir_x(4,dir),y+lengthdir_y(4,dir),1,1,dir,image_blend,image_alpha)
if image_index>=4 and image_index<5 draw_sprite_ext(sprMaskDropBack,global.maskindex,x+lengthdir_x(6,dir),y+lengthdir_y(6,dir),1,1,dir,image_blend,image_alpha)
if image_index>=5 and image_index<16 draw_sprite_ext(sprMaskDropBack,global.maskindex,x+lengthdir_x(7,dir),y+lengthdir_y(7,dir),1,1,dir,image_blend,image_alpha)
}
