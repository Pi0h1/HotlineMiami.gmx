/*CreateShell (sprM16Shell)*/
my_id=instance_create(x+lengthdir_x(armlength,dir-5*left),y+lengthdir_y(armlength,dir-5*left),objShell)
my_id.sprite_index=argument0
my_id.image_angle=dir
my_id.direction=dir-90*left-20+random(30)
my_id.speed=1+random(3)
