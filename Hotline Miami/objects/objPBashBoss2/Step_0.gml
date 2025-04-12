if hurtindex=10 {
if image_index=0 {
instance_create(x,y,objPlayerMouse)
global.done=1
with objDoorH solid=0
with objDoorH2 solid=0
my_id=instance_create(x+lengthdir_x(11,image_angle),y+lengthdir_y(11,image_angle),objBloodPool)
my_id=instance_create(x,y,objDeadBody)
my_id.sprite_index=sprBoss2Dead
my_id.image_angle=image_angle
instance_destroy()
}
}
