if sprite_index=sprShieldSnapUzi or sprite_index=sprShieldSnapMP5 or sprite_index=sprShieldSnapDoubleBarrel or sprite_index=sprShieldSnapSilencer or sprite_index=sprShieldSnapScorpion or sprite_index=sprShieldSnapMagnum exit
if reset=1 exit
if energie<8 {my_id=instance_create(x,y,objDeadBody) my_id.sprite_index=sprEBackMachinegun my_id.image_index=floor(random(4))
global.dir=dir
with my_id move_contact_solid(global.dir-45,12)
my_id.direction=dir
my_id.speed=2+random(1)
my_id.image_angle=my_id.direction
my_id.type=objEnemy
my_id=instance_create(x,y,objPlayerMouse)
my_id.ammo=ammo
my_id.release=1
instance_destroy()
} else {
if sprite_index=sprPHumanShieldDoubleBarrel sprite_index=sprShieldSnapDoubleBarrel
if sprite_index=sprPHumanShieldMagnum sprite_index=sprShieldSnapMagnum
if sprite_index=sprPHumanShieldScorpion sprite_index=sprShieldSnapScorpion
if sprite_index=sprPHumanShieldUzi sprite_index=sprShieldSnapUzi
if sprite_index=sprPHumanShieldMP5 sprite_index=sprShieldSnapMP5
if sprite_index=sprPHumanShieldSilencer sprite_index=sprShieldSnapSilencer
image_speed=0.2
image_index=0
}
