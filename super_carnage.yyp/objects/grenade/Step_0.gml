if start=1
{
if time>0 time-=1 else
{
instance_create(x,y,soot)
global.call_id=id
with enemy 
{
if point_distance(x,y,global.call_id.x,global.call_id.y)<96
{
if intersection(x,y,global.call_id.x,global.call_id.y,6)<0
{
exploded=1
exp_x=global.call_id.x
exp_y=global.call_id.y
instance_destroy()
}
}
else
{
if !object_index=dog
{
if point_distance(x,y,global.call_id.x,global.call_id.y)<180
{
if intersection(x,y,global.call_id.x,global.call_id.y,6)<0
{
door_hit=1
index=0
sprite_index=get_up
direction=point_direction(global.call_id.x,global.call_id.y,x,y)
my_speed=3+random(2)
if armed=1
{
armed=0
my_i=instance_create(x,y,gun_drop)
my_i.image_angle=direction
my_i.direction=direction-20+random(40)
my_i.speed=1+random(0.5)
}
}
}
}
}
}
sound_play(explo)
dir=random(360)
repeat(32)
{
my_i=instance_create(x,y,explosion_particle)
my_i.direction=dir
my_i.speed=5+random(5)
dir+=360/32
}
number=8
repeat (number)
{
my_i=instance_create(x+lengthdir_x(24,dir),y+lengthdir_y(24,dir),big_particle)
my_i.direction=dir
my_i.speed=2+random(1.5)
dir+=360/number
}
repeat 10 instance_create(x-32+random(64),y-32+random(64),object60)
instance_destroy()
}
}
