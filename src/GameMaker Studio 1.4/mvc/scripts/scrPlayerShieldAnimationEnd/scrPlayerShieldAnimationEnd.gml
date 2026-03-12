image_speed=0
if sprite_index=sprPHumanShieldDoubleBarrelShoot1 sprite_index=sprPHumanShieldDoubleBarrel
if sprite_index=sprPHumanShieldDoubleBarrelShoot2 sprite_index=sprPHumanShieldDoubleBarrel
if sprite_index=sprPHumanShieldSilencerShoot sprite_index=sprPHumanShieldSilencer
if sprite_index=sprPHumanShieldUziShoot sprite_index=sprPHumanShieldUzi
if sprite_index=sprPHumanShieldMagnumShoot sprite_index=sprPHumanShieldMagnum
if sprite_index=sprPHumanShieldScorpionShoot sprite_index=sprPHumanShieldScorpion
if sprite_index=sprPHumanShieldMP5Shoot sprite_index=sprPHumanShieldMP5

if sprite_index=sprShieldSnapMP5 {
my_id=instance_create(x,y,objDeadBody) 
my_id.sprite_index=sprEBackShieldSnap
global.dir=dir
with my_id move_contact_solid(global.dir-45,12)
my_id.direction=dir
my_id.image_yscale=1
my_id.speed=2+random(1)
my_id.image_angle=my_id.direction
my_id=instance_create(x,y,objPlayerMouse)
my_id.ammo=ammo
my_id.release=1
my_id.sprite_index=sprPWalkMP5
instance_destroy()
}

if sprite_index=sprShieldSnapScorpion {
my_id=instance_create(x,y,objDeadBody) 
my_id.sprite_index=sprEBackShieldSnap
global.dir=dir
with my_id move_contact_solid(global.dir-45,12)
my_id.direction=dir
my_id.image_yscale=1
my_id.speed=2+random(1)
my_id.image_angle=my_id.direction
my_id=instance_create(x,y,objPlayerMouse)
my_id.ammo=ammo
my_id.release=1
my_id.sprite_index=sprPWalkScorpion
instance_destroy()
}

if sprite_index=sprShieldSnapMagnum {
my_id=instance_create(x,y,objDeadBody) 
my_id.sprite_index=sprEBackShieldSnap
global.dir=dir
with my_id move_contact_solid(global.dir-45,12)
my_id.direction=dir
my_id.image_yscale=1
my_id.speed=2+random(1)
my_id.image_angle=my_id.direction
my_id=instance_create(x,y,objPlayerMouse)
my_id.ammo=ammo
my_id.release=1
my_id.sprite_index=sprPWalkMagnum
instance_destroy()
}

if sprite_index=sprShieldSnapDoubleBarrel {
my_id=instance_create(x,y,objDeadBody) 
my_id.sprite_index=sprEBackShieldSnap
global.dir=dir
with my_id move_contact_solid(global.dir-45,12)
my_id.direction=dir
my_id.image_yscale=1
my_id.speed=2+random(1)
my_id.image_angle=my_id.direction
my_id=instance_create(x,y,objPlayerMouse)
my_id.ammo=ammo
my_id.release=1
my_id.sprite_index=sprPWalkDoubleBarrel
instance_destroy()
}

if sprite_index=sprShieldSnapUzi {
my_id=instance_create(x,y,objDeadBody) 
my_id.sprite_index=sprEBackShieldSnap
global.dir=dir
with my_id move_contact_solid(global.dir-45,12)
my_id.direction=dir
my_id.image_yscale=1
my_id.speed=2+random(1)
my_id.image_angle=my_id.direction
my_id=instance_create(x,y,objPlayerMouse)
my_id.ammo=ammo
my_id.release=1
my_id.sprite_index=sprPWalkUzi
instance_destroy()
}

if sprite_index=sprShieldSnapSilencer {
my_id=instance_create(x,y,objDeadBody) 
my_id.sprite_index=sprEBackShieldSnap
global.dir=dir
with my_id move_contact_solid(global.dir-45,12)
my_id.direction=dir
my_id.image_yscale=1
my_id.speed=2+random(1)
my_id.image_angle=my_id.direction
my_id=instance_create(x,y,objPlayerMouse)
my_id.ammo=ammo
my_id.release=1
my_id.sprite_index=sprPWalkSilencer
instance_destroy()
}
