if !instance_exists(player) exit
if other.swing_speed>0 or other.swing_speed<0 
{
if intersection(x,y,player.x,player.y,4)<0 
{
sound_play(crush)
other.image_index=1
instance_destroy()
dir=random(360)
repeat 12
{
my_blood=instance_create(x,y,blood_splat)
my_blood.image_angle=dir
dir+=360/12
}
}
}
