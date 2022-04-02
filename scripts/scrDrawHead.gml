var head=head_index;

if argument0
{
left=1 dir=image_angle
}
maskdir=point_direction(0, 0, maskaddx[floor(image_index)],maskaddy[floor(image_index)]*left)+dir
dist=point_distance(0, 0, maskaddx[floor(image_index)],maskaddy[floor(image_index)]*left)
maddx=lengthdir_x(dist,maskdir)
maddy=lengthdir_y(dist,maskdir)
draw_sprite_ext(head,head_FrameIndex,x+maddx,y+maddy,image_xscale,image_yscale,dir,image_blend,image_alpha)


head_FrameIndex+=0.2

if global.godmode=1{
d3d_set_fog(true,c_aqua,0,1)
draw_sprite_ext(head,head_FrameIndex,x+maddx,y+maddy,image_xscale,image_yscale,dir,c_black,0.2)
d3d_set_fog(0,0,0,0)

d3d_set_fog(true,c_white,0,0)
draw_sprite_ext(head,head_FrameIndex,x+maddx,y+maddy,image_xscale,image_yscale,dir,image_blend,0.1+lengthdir_x(0.1,goddir))
d3d_set_fog(0,0,0,0)
}


if sprite_index=sprPMaskSlip {
draw_sprite_ext(masksprite,image_index,x,y,image_xscale,image_yscale*left,dir,image_blend,image_alpha)
}
