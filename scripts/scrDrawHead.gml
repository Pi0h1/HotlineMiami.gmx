if argument0
{
left=1 dir=image_angle
}
maskdir=point_direction(0, 0, maskaddx[floor(image_index)],maskaddy[floor(image_index)]*left)+dir
dist=point_distance(0, 0, maskaddx[floor(image_index)],maskaddy[floor(image_index)]*left)
maddx=lengthdir_x(dist,maskdir)
maddy=lengthdir_y(dist,maskdir)
draw_sprite_ext(sprPlayerHead,headindex,x+maddx,y+maddy,image_xscale,image_yscale,dir,image_blend,image_alpha)
headindex+=0.2

if sprite_index=sprPMaskSlip {
draw_sprite_ext(masksprite,image_index,x,y,image_xscale,image_yscale*left,dir,image_blend,image_alpha)
}
