if instance_exists(objPlayerMouse) or instance_exists(objPlayerMouseHouse) {
with objPlayer {
if persistent=1 {

if object_index=objPlayerHospital {
draw_set_blend_mode(bm_add)
draw_circle_color(x,y,48+random(6)+light,make_color_hsv(0,0,30+light*2),c_black,0)
draw_set_blend_mode(bm_normal)
legsprite=sprLegsLimp
draw_sprite_ext(legsprite,legindex,x+1,y+1,image_xscale,image_yscale,legdir,c_black,0.5)
draw_sprite_ext(sprite_index,image_index,x+1,y+1,image_xscale,image_yscale*left,dir,c_black,0.5)
draw_sprite_ext(legsprite,legindex,x,y,image_xscale,image_yscale,legdir,image_blend,image_alpha)
if sprite_index=sprPWalkHospital dir=point_direction(x,y,global.mousex,global.mousey)
draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale*left,dir,image_blend,image_alpha)
if reload>0 reload-=1
if light>3 light-=3
} else {

x-=view_xview[0]
y-=view_yview[0]


if sprite_index=last_sprite nothing=1 else {
scrUpdateMaskPos(sprite_index)
last_sprite=sprite_index
}

draw_set_blend_mode(bm_add)
draw_circle_color(x,y,48+random(6)+light,make_color_hsv(0,0,30+light*2),c_black,0)
draw_set_blend_mode(bm_normal)
if myspeed=2.25 legsprite=sprLegsStairs else legsprite=sprLegs
if sprite_index=sprPWalkHospital legsprite=sprLegsHospital
dir=point_direction(x+view_xview[0],y+view_yview[0],global.mousex,global.mousey)
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
if maskon=1 scrDrawMask(0)

x+=view_xview[0]
y+=view_yview[0]
}
}
}
}

with objPlayerBiker {
if persistent=1 {
x-=view_xview[0]
y-=view_yview[0]
if myspeed=2.25 legsprite=sprBikerLegsStairs else legsprite=sprBikerLegs
draw_set_blend_mode(bm_add)
draw_circle_color(x,y,48+random(6)+light,make_color_hsv(0,0,30+light*2),c_black,0)
draw_set_blend_mode(bm_normal)
draw_sprite_ext(legsprite,legindex,x+1,y+1,image_xscale,image_yscale,legdir,c_black,0.5)
draw_sprite_ext(sprite_index,image_index,x+1,y+1,image_xscale,image_yscale*left,dir,c_black,0.5)
draw_sprite_ext(legsprite,legindex,x,y,image_xscale,image_yscale,legdir,image_blend,image_alpha)
dir=point_direction(x+view_xview[0],y+view_yview[0],global.mousex,global.mousey)
draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale*left,dir,image_blend,image_alpha)
if reload>0 reload-=1
if light>3 light-=3
x+=view_xview[0]
y+=view_yview[0]
}
}

with objPlayerBikerHouse {
if persistent=1 {
x-=view_xview[0]
y-=view_yview[0]
if myspeed=2.25 legsprite=sprBikerLegsStairs else legsprite=sprBikerLegs
draw_set_blend_mode(bm_add)
draw_circle_color(x,y,48+random(6)+light,make_color_hsv(0,0,30+light*2),c_black,0)
draw_set_blend_mode(bm_normal)
draw_sprite_ext(legsprite,legindex,x+1,y+1,image_xscale,image_yscale,legdir,c_black,0.5)
draw_sprite_ext(sprite_index,image_index,x+1,y+1,image_xscale,image_yscale*left,dir,c_black,0.5)
draw_sprite_ext(legsprite,legindex,x,y,image_xscale,image_yscale,legdir,image_blend,image_alpha)
if aimon=1 dir=point_direction(x+view_xview[0],y+view_yview[0],global.mousex,global.mousey)
draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale*left,dir,image_blend,image_alpha)
if reload>0 reload-=1
if light>3 light-=3
x+=view_xview[0]
y+=view_yview[0]
}
}
