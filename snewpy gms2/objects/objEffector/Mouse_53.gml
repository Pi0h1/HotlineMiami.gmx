exit
repeat (18) {
my_id=instance_create(mouse_x,mouse_y,objBloodDrop)
my_id.speed=2+random(1)
my_id.direction=random(360)
my_id.image_angle=my_id.direction
}

repeat (6) {
my_id=instance_create(mouse_x-2+random(4),mouse_y-2+random(4),objBloodSmoke)
my_id.speed=2+random(1)
my_id.direction=point_direction(mouse_x,mouse_y,my_id.x,my_id.y)
my_id.image_angle=my_id.direction
}

dir=random(360)
repeat (12) {
my_id=instance_create(mouse_x-1+random(2),mouse_y-1+random(2),objBloodHit)
my_id.speed=1+random(2)
my_id.friction=0.2
my_id.direction=dir-45+random(90)
my_id.image_angle=my_id.direction
}

repeat (2+round(random(2))) {
instance_create(mouse_x-7+random(14),mouse_y-7+random(14),objBloodSplat)
}

type=choose(0,1,2,3)
if type=0 {
repeat (6) {
my_id=instance_create(mouse_x-2+random(4),mouse_y-2+random(4),objBrains)
my_id.speed=2+random(1)
my_id.direction=point_direction(mouse_x,mouse_y,my_id.x,my_id.y)
my_id.image_angle=my_id.direction
}
} 
if type=1 {
repeat (1+round(random(1))) {
my_id=instance_create(mouse_x,mouse_y,objBrainChunk2)
my_id.speed=1+random(0.5)
my_id.direction=dir-10+random(20)
my_id.image_angle=my_id.direction
}
}

if type=2 {
repeat (5) {
my_id=instance_create(mouse_x,mouse_y,objSkinPiece2)
my_id.speed=1+random(1)
my_id.direction=random(360)
my_id.image_angle=my_id.direction
}
}

if type=3 {
repeat (8) {
my_id=instance_create(mouse_x,mouse_y,objGuts2)
my_id.speed=1+random(1)
my_id.direction=direction-160-random(40)
my_id.image_angle=my_id.direction
}
}
