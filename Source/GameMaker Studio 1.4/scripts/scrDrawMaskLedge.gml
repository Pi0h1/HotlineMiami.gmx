if argument0 {left=1 dir=image_angle}
maskdir=point_direction(0,0,maskaddx[floor(image_index)],maskaddy[floor(image_index)]*left)
dist=point_distance(0,0,maskaddx[floor(image_index)],maskaddy[floor(image_index)]*left)
maddx=lengthdir_x(dist,maskdir)
maddy=lengthdir_y(dist,maskdir)
draw_sprite_ext(sprMasks,global.maskindex,x+maddx+1,y+maddy+1,image_xscale,image_yscale*left,dir,c_black,0.25)
draw_sprite_ext(sprMasks,global.maskindex,x+maddx,y+maddy,image_xscale,image_yscale*left,dir,image_blend,image_alpha)
