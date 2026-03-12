if persistent=1 exit
if sprite_index=last_sprite nothing=1 else {
scrUpdateMaskPos(sprite_index)
last_sprite=sprite_index
}
if myspeed=2.25 legsprite=sprLegsStairs else //legsprite=sprLegs
legsprite=sprEFatLegs
draw_set_blend_mode(bm_add)
draw_circle_color(x,y,48+random(6)+light,make_color_hsv(0,0,30+light*2),c_black,0)
draw_set_blend_mode(bm_normal)
draw_sprite_ext(legsprite,legindex,x+1,y+1,image_xscale,image_yscale,legdir,c_black,0.5)
draw_sprite_ext(sprite_index,image_index,x+1,y+1,image_xscale,image_yscale*left,dir,c_black,0.5)
draw_sprite_ext(legsprite,legindex,x,y,image_xscale,image_yscale,legdir,image_blend,image_alpha)
dir=point_direction(x,y,global.mousex,global.mousey)
if sprite_index=sprPLeaveBag {
dir=point_direction(x,y,objDumpster.x+20,objDumpster.y+12)
}
draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale*left,dir,image_blend,image_alpha)
if reload>0 reload-=1
if light>3 light-=3
if sprite_index=sprPWalkThrow {
left=1
draw_sprite_ext(sprThrowWeapons,throwindex,x+lengthdir_x(throwadd[floor(image_index)],dir)+lengthdir_x(7,dir-90)+1,y+1+lengthdir_y(throwadd[floor(image_index)],dir)+lengthdir_y(7,dir-90),image_xscale,image_yscale,dir+lengthdir_x(20,360*(image_index*(1/8))),c_black,0.5)
draw_sprite_ext(sprThrowWeapons,throwindex,x+lengthdir_x(throwadd[floor(image_index)],dir)+lengthdir_x(7,dir-90),y+lengthdir_y(throwadd[floor(image_index)],dir)+lengthdir_y(7,dir-90),image_xscale,image_yscale,dir+lengthdir_x(20,360*(image_index*(1/8))),image_blend,image_alpha)
}
if sprite_index=sprPMaskSlip {
draw_sprite_ext(masksprite,image_index,x,y,image_xscale,image_yscale*left,dir,image_blend,image_alpha)
}
if sprite_index=sprPigButcher or sprite_index=sprPigButcherAttack or sprite_index=sprPigButcherWalkMP5 or sprite_index=sprPigButcherShoot exit
//if maskon=1 scrDrawMask(0)
