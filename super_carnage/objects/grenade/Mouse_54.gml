if !instance_exists(player) exit
if on=0 and player.gun=-1 and distance_to_object(player)<4 and intersection(x,y,player.x,player.y,4)<0
{
on=1
player.holding=1
}


