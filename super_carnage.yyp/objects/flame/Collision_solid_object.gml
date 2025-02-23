if smoked=0
{
smoked=1
my_i=instance_create(x,y,smoke2)
my_i.direction=start_dir
with my_i move_contact_solid(direction,12)
my_i.direction=random(360)
my_i.speed=0.5+random(0.25)
}
speed=0
