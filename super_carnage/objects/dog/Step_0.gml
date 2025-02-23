my_angle=direction
if !instance_exists(player) {image_index=2 image_speed=0 sprite_index=dog_run exit}
if active=0
{
if my_speed=0.5
{
direction=round(direction/5)*5
if !place_free(x+lengthdir_x(16,direction),y+lengthdir_y(16,direction)) or frac(direction/45)>0 direction+=dir_change*5 else dir_change=-1+round(random(1))*2 
}
else
{
turn_toward_direction(point_direction(x,y,last_seen_x,last_seen_y),5)
if point_distance(x,y,last_seen_x,last_seen_y)<3 active=0
if !place_free(x+lengthdir_x(8,direction),y+lengthdir_y(8,direction)) 
{
my_speed=0.5
image_speed=0.2
sprite_index=dog_walk
}
}
if round(random(360))=1 and my_speed>0.5 direction+=dir_change*5
if reload>0 reload-=1 else
{
if point_distance(x,y,player.x,player.y)<260
{
if intersection(x,y,player.x,player.y,8)<0
{
active=1
}
}
reload=10
}
}
if active=1
{
if intersection(x,y,player.x,player.y,8)>0 
{
while i<4 and intersection(x,y,last_seen_x,last_seen_y,8)>0
{
last_seen_x=player.x+lengthdir_x(64,90*i)
last_seen_y=player.y+lengthdir_y(64,90*i)
i+=1
}
active=0 
alarm[0]=120
exit
}
turn_toward_direction(point_direction(x,y,player.x,player.y),10)
my_speed=2.5
image_speed=0.4
sprite_index=dog_run
last_seen_x=player.x+lengthdir_x(64,round(point_direction(player.x,player.y,x,y)/90)*90)
last_seen_y=player.y+lengthdir_y(64,round(point_direction(player.x,player.y,x,y)/90)*90)
i=0
}


if my_speed>0
{
if place_free(x+lengthdir_x(my_speed,direction),y) x+=lengthdir_x(my_speed,direction)
if place_free(x,y+lengthdir_y(my_speed,direction)) y+=lengthdir_y(my_speed,direction)
}

