sprite_index=sprOldmanDeath
image_index=0
repeat (8) {
my_id=instance_create(x+5,y-8,objBloodDrop)
my_id.direction=60-10+random(20)
my_id.speed=2+random(3)
my_id.image_xscale=1+random(0.2)
my_id.image_yscale=my_id.image_xscale
my_id.image_angle=random(360)
}
repeat (3) {
my_id=instance_create(x-4,y-8,objBloodSmoke)
my_id.direction=60-30+random(60)
my_id.speed=1+random(1)
my_id.image_xscale=1+random(0.2)
my_id.image_yscale=my_id.image_xscale
my_id.image_angle=my_id.direction
}
with other instance_destroy()
