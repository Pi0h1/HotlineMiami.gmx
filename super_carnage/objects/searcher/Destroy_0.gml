if flamed>=1
{
my_i=instance_create(x,y,burning_patroller)
my_i.my_angle=direction
my_i.direction=direction-180
my_i.my_speed=2
if armed=1
{
my_i=instance_create(x,y,gun_drop)
my_i.image_angle=image_angle
my_i.direction=image_angle
my_i.speed=1+random(0.5)
}
exit
}


if splitt=1
{
dir=random(360)
repeat 12
{
my_i=instance_create(x,y,blood_splat)
my_i.image_angle=dir
dir+=360/8
}
my_i=instance_create(x,y,dead_patroller)
my_i.image_angle=player.my_angle+(90+random(30))/splitt_dir
my_i.direction=my_i.image_angle
my_i.speed=2+random(1)
my_i.image_index=6+round(random(1))
if my_i.image_index=7
{
dir=random(360)
repeat 8
{
my_i=instance_create(x,y,flesh)
my_i.direction=dir
my_i.speed=1.5+random(1.5)
dir+=360/8
}
my_i=instance_create(x,y,splitt_patroller)
my_i.image_angle=player.my_angle+(90+random(30))/splitt_dir
my_i.direction=my_i.image_angle-180
my_i.speed=2+random(1)
}
if armed=1
{
my_i=instance_create(x,y,gun_drop)
my_i.image_angle=direction+90
my_i.direction=direction-45-25+random(50)
my_i.speed=1+random(0.5)
}
exit
}

if clubbed=1
{
my_i=instance_create(x,y,dead_patroller)
my_i.image_angle=point_direction(player.x,player.y,x,y)-20+random(40)
my_i.direction=my_i.image_angle
my_i.speed=2
my_i.image_index=9
if armed=1
{
my_i=instance_create(x,y,gun_drop)
my_i.image_angle=random(360)
my_i.direction=point_direction(x,y,player.x,player.y)-40+random(80)
my_i.speed=1+random(0.5)
}
exit
}

if exploded=1
{
i=0
repeat 7
{
my_i=instance_create(x-4+random(8),y-4+random(8),enemy_pieces)
my_i.direction=point_direction(exp_x,exp_y,my_i.x,my_i.y)-45+random(90)
my_i.speed=3+random(2)
my_i.image_index=i
i+=1
}
dir=random(360)
repeat (32)
{
my_i=instance_create(x,y,blood_splat)
my_i.image_angle=dir
dir+=360/12
}
dir=random(360)
repeat (36)
{
my_i=instance_create(x,y,flesh)
my_i.image_angle=dir
my_i.direction=dir
my_i.speed=2+random(1)
dir+=360/36
}
repeat (120)
{
instance_create(x-64+random(128),y-64+random(128),blood_small)
}
exit
}


my_i=instance_create(x,y,dead_patroller)
my_i.image_angle=dead_dir
my_i.direction=dead_dir
my_i.speed=2
my_i.image_index=floor(random(6))
if armed=1
{
my_i=instance_create(x,y,gun_drop)
my_i.image_angle=dead_dir+90
my_i.direction=dead_dir-45-25+random(50)
my_i.speed=1+random(0.5)
}

