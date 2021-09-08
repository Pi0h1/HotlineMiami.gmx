sprite_angle=0
image_speed=0
corner_index=argument0
sprite_index=argument1
my_id=instance_create(x,y,objCorner)
my_id.sprite_index=corner_index
my_id.depth=depth-1

/*
if object_index=objWallShadow or object_index=objRailV exit
my_shadow=instance_create(x,y,objWallShadow)
my_shadow.image_xscale=image_xscale
my_shadow.image_yscale=image_yscale
*/
