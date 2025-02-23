with other instance_destroy()
repeat 2+random(2)
{
ii=instance_create(x,y,blood_splat)
ii.image_angle=other.image_angle+145+random(90)
}
if energie>0 energie-=1 else {dead_dir=other.direction instance_destroy()}
