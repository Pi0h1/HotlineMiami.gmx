if !instance_exists(player) exit
if on=1
{
if place_meeting(x,y,solid_object)
{
move_outside_solid(point_direction(x,y,player.x,player.y),-1)
on=0
}
speed=1+random(0.5)
friction=0.2
direction=player.my_angle
dir_change=-1+round(random(1))*2
player.gun=-1
on=0
} else {
if player.gun=-1 and distance_to_object(player)<20 and intersection(x,y,player.x,player.y,4)<0
{
player.gun=-2
on=1
}
}

