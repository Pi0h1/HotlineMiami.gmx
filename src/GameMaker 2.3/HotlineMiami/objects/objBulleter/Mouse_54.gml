dir=random(360)
repeat (22) {
my_id=instance_create(mouse_x-1+random(2),mouse_y-1+random(2),objBloodDrop)
my_id.speed=1+random(2)
my_id.direction=dir-90+random(180)
my_id.image_angle=my_id.direction
}

repeat (3) {
my_id=instance_create(mouse_x,mouse_y,objBloodCut)
my_id.speed=2+random(1)
my_id.direction=dir-180
my_id.image_angle=my_id.direction
}

repeat (2+round(random(2))) {
instance_create(mouse_x-7+random(14),mouse_y-7+random(14),objBloodSplat)
}

if round(random(3))=2 {
repeat (8) {
my_id=instance_create(mouse_x,mouse_y,objGuts)
my_id.speed=1+random(1)
my_id.direction=dir+20-random(40)
my_id.image_angle=my_id.direction
}
}
