global.test=0
with objDoorV {
if sprite_index=sprBombDoorV {if image_angle>0 or image_angle<0 global.test=1}
}
with objDoorH2 {
if sprite_index=sprBombDoorH {if image_angle>0 or image_angle<0 global.test=1}
}

if global.test=1 {
if on=0 {
image_index=2
audio_play_sound(sndBigExplosion,0,false) 
sxeasy_setVolume(0.1) 
vol=0.1
starttime=current_time 
with objBombGuy {
repeat (12) {
my_id=instance_create(x,y,objDoorDebris)
my_id.direction=random(360)
my_id.speed=2+random(3)
my_id.friction=0.1
}

repeat (24) {
my_id=instance_create(x-3+random(6),y-3+random(6),objBloodDrop)
my_id.image_xscale=1-random(0.2)
my_id.image_yscale=my_id.image_xscale
my_id.image_angle=point_direction(x,y,my_id.x,my_id.y)
my_id.sprite_index=sprBloodSplatSmall
my_id.direction=my_id.image_angle
my_id.speed=2+random(4)
}


instance_create(x,y,objBombGround)
instance_create(x,y,objBombGuyDie)
instance_destroy()
}
with objEBombTinker {
sprite_index=sprExplodedBody2
image_angle=45
speed=2.5
direction=45
}
with objBombCables {
sprite_index=sprBombCablesBroken
image_speed=0.12
}

with objWindowV {
if x=64 and y=224 {
instance_create(x,y,objWindowExplode)
instance_destroy()
}
}

with objEStandGuardBomb {
sprite_index=sprExplodedBody1
image_angle=-90
speed=3
direction=270
}

with objDoorH2 {
if sprite_index=sprBombDoorH {
my_id=instance_create(x,y,objDestroyedDoor)
my_id.direction=90
my_id.speed=3+random(1)
instance_destroy()
}
}

with objDoorV2 {
if sprite_index=sprBombDoorV {
my_id=instance_create(x,y,objDestroyedDoor)
my_id.direction=0
my_id.speed=3+random(1)
my_id.image_angle=-90
instance_destroy()
}
}
image_index=9
with objPlayer {
if place_meeting(x,y,objExplosion) {
my_id=instance_create(x,y,objPlayerBombDead)
my_id.direction=point_direction(objExplosion.x+85,objExplosion.y+85,x,y)
my_id.image_angle=my_id.direction
my_id.speed=5

with my_id {
repeat (24) {
my_id=instance_create(x-3+random(6),y-3+random(6),objBloodDrop)
my_id.image_xscale=1-random(0.2)
my_id.image_yscale=my_id.image_xscale
my_id.image_angle=point_direction(x,y,my_id.x,my_id.y)
my_id.sprite_index=sprBloodSplatSmall
my_id.direction=direction-90+random(180)
my_id.speed=2+random(4)
}
}

instance_destroy()
}
}
image_index=2

} 
on=1
}

if on=1 {
if current_time-starttime>4000 {
if vol<1 {vol+=0.01 sxeasy_setVolume(vol)}
}
}

