if !instance_exists(player) exit
if other.swing_speed>0 or other.swing_speed<0 
{
if intersection(x,y,player.x,player.y,4)<0 
{
other.image_index=1
if other.object_index=sword or other.object_index=axe or other.object_index=machete
{
splitt=1
splitt_dir=other.swing_speed/10
}
else
{
sound_play(crush)
clubbed=1
splitt_dir=other.swing_speed/10
}
instance_destroy()
}
}

