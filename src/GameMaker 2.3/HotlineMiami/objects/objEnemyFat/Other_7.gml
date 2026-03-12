update=0
if sprite_index=sprEFatDie {
my_id=instance_create(x,y,objDeadBody)
my_id.direction=direction-180
my_id.speed=0.5
my_id.sprite_index=sprEFatDead
if shotgunned=1 my_id.image_index=floor(random(2)) else my_id.image_index=2+floor(random(2))
my_id.image_angle=my_id.direction
instance_destroy()
exit
}

if sprite_index=sprEFatAttack {sprite_index=sprEFatWalk update=1}
if sprite_index=sprESearchFat {sprite_index=sprEFatWalk image_speed=0}
if update=1 {
image_speed=0
image_yscale=-image_yscale
}
