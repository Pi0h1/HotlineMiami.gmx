if image_index=1 
{
repeat 3+random(3)
{
my_i=instance_create(x+lengthdir_x(15,image_angle-35),y+lengthdir_y(15,image_angle-35),spurt_long)
my_i.image_angle=image_angle-30-random(75)
my_i.target=id
my_i.dir=0
}
repeat (4+round(random(4)))
{
my_i=instance_create(x+lengthdir_x(10,image_angle-35),y+lengthdir_y(10,image_angle-35),flesh)
my_i.speed=1.5+random(1.5)
my_i.direction=image_angle-30-random(30)
}
}


if image_index=2 
{
repeat 3+random(3)
{
my_i=instance_create(x+lengthdir_x(15,image_angle+35),y+lengthdir_y(15,image_angle+35),spurt_long)
my_i.image_angle=image_angle+30+random(75)
my_i.target=id
my_i.dir=1
}
repeat (4+round(random(4)))
{
my_i=instance_create(x+lengthdir_x(10,image_angle+30),y+lengthdir_y(10,image_angle+30),flesh)
my_i.speed=1.5+random(1.5)
my_i.direction=image_angle+30+random(30)
}
}


if image_index=3
{
repeat (4+round(random(4)))
{
my_i=instance_create(x,y,flesh)
my_i.speed=2+random(1.5)
my_i.direction=image_angle-90+random(180)
}
}

if image_index=4 or image_index=9
{
repeat 4+random(2)
{
my_i=instance_create(x+lengthdir_x(15,image_angle),y+lengthdir_y(15,image_angle),spurt_long)
my_i.image_angle=image_angle-45+random(90)
my_i.target=id
my_i.dir=3
}
repeat (4+round(random(4)))
{
if round(random(1))=0 my_i=instance_create(x+lengthdir_x(10,image_angle),y+lengthdir_y(10,image_angle),flesh) else my_i=instance_create(x+lengthdir_x(10,image_angle),y+lengthdir_y(10,image_angle),brains)
my_i.speed=1.5+random(1.5)
my_i.direction=image_angle-30+random(60)
}
}

if image_index=5
{
repeat (4+round(random(4)))
{
if round(random(1))=0 my_i=instance_create(x+lengthdir_x(15,image_angle),y+lengthdir_y(15,image_angle),flesh) else my_i=instance_create(x+lengthdir_x(15,image_angle),y+lengthdir_y(15,image_angle),brains)
my_i.speed=1.5+random(1.5)
my_i.direction=image_angle-20+random(40)
}
}

if image_index=7
{
repeat 4+random(2)
{
my_i=instance_create(x,y,spurt_long)
my_i.image_angle=image_angle-180-45+random(90)
my_i.target=id
my_i.dir=4
}
}
