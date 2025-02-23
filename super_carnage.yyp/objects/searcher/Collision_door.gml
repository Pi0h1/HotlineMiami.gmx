if door_hit=0
{
if other.angle_speed>4 or other.angle_speed<-4
{
sound_play(hit_door)
door_hit=1
index=0
sprite_index=get_up
if other.object_index=door_hor_left or other.object_index=door_hor_right
{
if other.y>y direction=90-10+random(20) else direction=270-10+random(20)
}
else
{
if other.x>x direction=180-10+random(20) else direction=-10+random(20)
}
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
other.solid=0

