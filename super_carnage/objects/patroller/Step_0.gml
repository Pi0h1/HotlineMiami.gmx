if !instance_exists(player) {ammo_load=0 exit}
if point_distance(x,y,player.x,player.y)<200
{
if intersection(x,y,player.x,player.y,8)<0 
{
if point_distance(x,y,player.x,player.y)<96 {replace=1 instance_destroy()} 
bull_check=instance_nearest(x,y,bullet)
if bull_check>0 
{
if point_distance(bull_check.x,bull_check.y,x,y)<144 and point_distance(x,y,player.x,player.y) {replace=1 instance_destroy()} 
}
}
}
if ammo_load>0 ammo_load-=1


if active=0
{
direction=round(direction/5)*5
if !place_free(x+lengthdir_x(24,direction),y+lengthdir_y(24,direction)) or !place_free(x+lengthdir_x(12,direction),y+lengthdir_y(12,direction)) or frac(direction/90)>0 direction+=5*dir_change
my_speed=1
my_angle=direction
if place_free(x+lengthdir_x(48,direction+90),y+lengthdir_y(48,direction+90)) and place_free(x+lengthdir_x(48,direction-90),y+lengthdir_y(48,direction-90)) and place_free(x+lengthdir_x(24,direction+90),y+lengthdir_y(24,direction+90)) and place_free(x+lengthdir_x(24,direction-90),y+lengthdir_y(24,direction-90)) and reload=0 {my_dir=90 face_dir=direction reload=320 active=2}
if intersection(x,y,player.x,player.y,8)<0 and collision_circle(x+lengthdir_x(60,my_angle),y+lengthdir_y(60,my_angle),45,player,0,1)>0 {replace=1 instance_destroy()} 
}
if react>0 react-=1
if react=1 {replace=1 instance_destroy()} 
