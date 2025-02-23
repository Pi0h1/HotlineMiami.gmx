my_i=instance_create(x,y,dead_dog)
my_i.direction=direction-180
my_i.image_angle=direction-180
my_i.speed=1.5+random(2)
if flamed=1 or exploded=1 {my_i.image_index=6 my_i.direction=direction my_i.speed=2.5 my_i.image_angle=direction my_i.friction=0.1 if exploded=1 my_i.direction=point_direction(exp_x,exp_y,x,y)}
