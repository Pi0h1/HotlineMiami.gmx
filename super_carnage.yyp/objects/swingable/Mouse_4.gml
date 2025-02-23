exit
if !instance_exists(player) exit

if on=0 and player.gun=-1 and distance_to_object(player)<20 and intersection(x,y,player.x,player.y,8)<0
{
player.gun=-2
on=1
}

