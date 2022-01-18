image_speed=0
if sprite_index=sprPHumanShieldDoubleBarrelShoot1 sprite_index=sprPHumanShieldDoubleBarrel
if sprite_index=sprPHumanShieldDoubleBarrelShoot2 sprite_index=sprPHumanShieldDoubleBarrel
if sprite_index=sprPHumanShieldSilencerShoot sprite_index=sprPHumanShieldSilencer
if sprite_index=sprPHumanShieldUziShoot sprite_index=sprPHumanShieldUzi
if sprite_index=sprPHumanShieldMagnumShoot sprite_index=sprPHumanShieldMagnum
if sprite_index=sprPHumanShieldScorpionShoot sprite_index=sprPHumanShieldScorpion
if sprite_index=sprPHumanShieldMP5Shoot sprite_index=sprPHumanShieldMP5

if sprite_index=sprShieldSnapMP5 {
createDeadBody(false,2,sprEBackShieldSnap,dir)
my_id=instance_create(x,y,objPlayerJacket)
my_id.ammo=ammo
my_id.release=1
my_id.sprite_index=sprPWalkMP5
instance_destroy()
}

if sprite_index=sprShieldSnapScorpion {
createDeadBody(false,2,sprEBackShieldSnap,dir)
my_id=instance_create(x,y,objPlayerJacket)
my_id.ammo=ammo
my_id.release=1
my_id.sprite_index=sprPWalkScorpion
instance_destroy()
}

if sprite_index=sprShieldSnapMagnum {
createDeadBody(false,2,sprEBackShieldSnap,dir)
my_id=instance_create(x,y,objPlayerJacket)
my_id.ammo=ammo
my_id.release=1
my_id.sprite_index=sprPWalkMagnum
instance_destroy()
}

if sprite_index=sprShieldSnapDoubleBarrel {
createDeadBody(false,2,sprEBackShieldSnap,dir)
my_id=instance_create(x,y,objPlayerJacket)
my_id.ammo=ammo
my_id.release=1
my_id.sprite_index=sprPWalkDoubleBarrel
instance_destroy()
}

if sprite_index=sprShieldSnapUzi {
createDeadBody(false,2,sprEBackShieldSnap,dir)
my_id=instance_create(x,y,objPlayerJacket)
my_id.ammo=ammo
my_id.release=1
my_id.sprite_index=sprPWalkUzi
instance_destroy()
}

if sprite_index=sprShieldSnapSilencer {
createDeadBody(false,2,sprEBackShieldSnap,dir)
my_id=instance_create(x,y,objPlayerJacket)
my_id.ammo=ammo
my_id.release=1
my_id.sprite_index=sprPWalkSilencer
instance_destroy()
}
