if place_meeting(x,y-24,player)
{
if image_angle<90 {if angle_speed=0 sound_play(door_open) angle_speed=5}
}
if place_meeting(x-16,y,player)
{
if player.y>y {if image_angle<90 {if angle_speed=0 sound_play(door_open) angle_speed=5}} else {if image_angle>-90 {if angle_speed=0 sound_play(door_open) angle_speed=-5}}
}
if place_meeting(x,y+24,player) 
{
if image_angle>-90 {if angle_speed=0 sound_play(door_open) angle_speed=-5}
}
if angle_speed=0 exit else
{
if angle_speed>0 {if image_angle+angle_speed<90 image_angle+=angle_speed else image_angle=90}
if angle_speed<0 {if image_angle+angle_speed>-90 image_angle+=angle_speed else image_angle=-90}
if angle_speed>0 angle_speed-=0.25
if angle_speed<0 angle_speed+=0.25
}
if solid<1 solid+=0.5
