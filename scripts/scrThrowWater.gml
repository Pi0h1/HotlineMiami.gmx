repeat (3+random(2)) {
my_id=instance_create(x+lengthdir_x(11,dir)-2+random(4),y+lengthdir_y(11,dir)-2+random(4),objPWater)
global.mydir=dir
with my_id move_contact_solid(global.mydir,10)
my_id.direction=point_direction(x,y,my_id.x,my_id.y)
my_id.speed=8
my_id.image_angle=my_id.direction
}
