image_speed=0
index=0
image_angle=random(360)

repeat (30) {
my_id=instance_create(x,y,objFlameParticle)
my_id.direction=random(360)
my_id.speed=2+random(3)
my_id.friction=0.15
}
