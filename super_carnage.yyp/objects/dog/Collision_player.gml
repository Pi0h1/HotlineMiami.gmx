image_speed=0
image_index=3
repeat 20 
{
instance_create(other.x+lengthdir_x(5+random(10),other.my_angle-45+random(90)),other.y+lengthdir_y(5+random(10),other.my_angle-45+random(90)),blood_small)
}
other.dead_dir=direction
with other instance_destroy()

