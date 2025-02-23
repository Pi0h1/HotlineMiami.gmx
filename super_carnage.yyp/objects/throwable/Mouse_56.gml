if on=1
{
if place_meeting(x,y,solid_object)
{
move_outside_solid(point_direction(x,y,player.x,player.y),-1)
on=0
}
else
{
on=0
speed=10
direction=player.my_angle
dir_change=-1+round(random(1))*2
player.holding=0
}
}
