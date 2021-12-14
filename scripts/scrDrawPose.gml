scrPlayerPoses()
//shadows were here

draw_sprite_ext(legsprite,legindex,x,y,image_xscale,image_yscale,legdir,image_blend,image_alpha)
draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale*left,dir,image_blend,image_alpha)
draw_sprite_ext(pose_index,image_index,x,y,image_xscale,image_yscale*left,dir,image_blend,image_alpha)

if global.godmode=1{
d3d_set_fog(true,c_aqua,0,1)
draw_sprite_ext(legsprite,legindex,x,y,image_xscale,image_yscale,legdir,c_black,0.2)
d3d_set_fog(0,0,0,0)

d3d_set_fog(true,c_white,0,0)
draw_sprite_ext(legsprite,legindex,x,y,image_xscale,image_yscale,legdir,c_black,0.1+lengthdir_x(0.1,goddir))
d3d_set_fog(0,0,0,0)

d3d_set_fog(true,c_aqua,0,1)
draw_sprite_ext(pose_index,image_index,x,y,image_xscale,(image_yscale)*left,dir,c_black,0.2)
d3d_set_fog(0,0,0,0)

d3d_set_fog(true,c_white,0,0)
draw_sprite_ext(pose_index,image_index,x,y,image_xscale,image_yscale*left,dir,image_blend,0.1+lengthdir_x(0.1,goddir))
d3d_set_fog(0,0,0,0)
}
goddir+=4

if sprite_index=sprPWalkThrow {
left=1
draw_sprite_ext(sprThrowWeapons,throwindex,x+lengthdir_x(throwadd[floor(image_index)],dir)+lengthdir_x(7,dir-90)+1,y+1+lengthdir_y(throwadd[floor(image_index)],dir)+lengthdir_y(7,dir-90),image_xscale,image_yscale,dir+lengthdir_x(20,360*(image_index*(1/8))),c_black,0.5)
draw_sprite_ext(sprThrowWeapons,throwindex,x+lengthdir_x(throwadd[floor(image_index)],dir)+lengthdir_x(7,dir-90),y+lengthdir_y(throwadd[floor(image_index)],dir)+lengthdir_y(7,dir-90),image_xscale,image_yscale,dir+lengthdir_x(20,360*(image_index*(1/8))),image_blend,image_alpha)
}

