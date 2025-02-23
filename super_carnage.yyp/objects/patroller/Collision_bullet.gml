with other instance_destroy()
repeat 2+random(2)
{
ii=instance_create(x,y,blood_splat)
ii.image_angle=other.direction-220+random(80)
}
{react=15 replace=0}
if energie>0 energie-=1 else {dead_dir=other.direction instance_destroy()}
sound_play(man_hit)
