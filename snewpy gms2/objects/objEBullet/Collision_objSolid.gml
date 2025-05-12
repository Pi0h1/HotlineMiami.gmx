if other.object_index=objWallSoftH or other.object_index=objWallSoftV {
my_id=instance_create(x+lengthdir_x(14,direction),y+lengthdir_y(14,direction),objHit)
my_id.image_angle=direction
my_id=instance_create(x+lengthdir_x(14,direction),y+lengthdir_y(14,direction),objSmokeHit)
my_id.image_angle=direction
my_id.direction=random(360)
my_id.speed=random(0.5)

repeat (4) {
my_id=instance_create(x+lengthdir_x(14,direction),y+lengthdir_y(14,direction),objDebris)
my_id.direction=random(360)
my_id.speed=random(4)
}
exit
}

if other.solid=1 move_contact_solid(direction,speed*2) else {
x-=hspeed
y-=vspeed
move_contact_all(direction,speed*2)
}
my_id=instance_create(x+lengthdir_x(14,direction),y+lengthdir_y(14,direction),objHit)
my_id.image_angle=direction
my_id=instance_create(x+lengthdir_x(14,direction),y+lengthdir_y(14,direction),objSmokeHit)
my_id.image_angle=direction
my_id.direction=random(360)
my_id.speed=random(0.5)

repeat (4) {
my_id=instance_create(x+lengthdir_x(14,direction),y+lengthdir_y(14,direction),objDebris)
my_id.direction=direction-140-random(80)
my_id.speed=random(4)
}

instance_destroy()
