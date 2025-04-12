if sprite_index=sprChiefDie {
my_id=instance_create(x,y,objDeadBody)
my_id.direction=direction-180
my_id.speed=0.5
my_id.sprite_index=sprChiefDead
my_id.image_angle=my_id.direction
instance_destroy()

exit
}

if sprite_index=sprChiefArm {
sprite_index=sprChiefShoot
image_index=16
image_speed=0
}
