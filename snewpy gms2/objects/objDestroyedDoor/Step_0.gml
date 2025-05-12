//if !place_free(x,y) speed=0
if image_index<9 image_index+=0.3+random(0.2) else {
if broke=0 {
if image_angle=0 {
repeat 6 {
my_id=instance_create(x-random(32),y-random(60),objDoorDebris)
my_id.direction=point_direction(x-16,y-30,my_id.x,my_id.y)
my_id.speed=random(4)
my_id.friction=0.2
}
} else {
repeat 6 {
my_id=instance_create(x+random(60),y-random(32),objDoorDebris)
my_id.direction=point_direction(x+30,y-16,my_id.x,my_id.y)
my_id.speed=random(4)
my_id.friction=0.2
}
}

broke=1
}
}
