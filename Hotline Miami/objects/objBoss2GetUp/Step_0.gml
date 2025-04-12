if wait>0 wait-=1 else {
if image_index<5 image_index+=0.25 else {
my_id=instance_create(x,y,objBoss2)
my_id.image_angle=image_angle
my_id.energie=energie
my_id.state=3
instance_destroy()
}
}
