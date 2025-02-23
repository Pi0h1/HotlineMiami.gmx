if door_hit=0 and other.speed>0
{
if other.speed>2 sound_play(throw_hit)
if other.speed>4
{
door_hit=1
index=0
sprite_index=get_up
direction=other.direction
my_speed=2+random(2)
if armed=1
{
armed=0
my_i=instance_create(x,y,gun_drop)
my_i.image_angle=direction
my_i.direction=direction-180-20+random(40)
my_i.speed=1+random(0.5)
}
}
other.speed=other.speed/2
other.direction-=180-20+random(40)
}

