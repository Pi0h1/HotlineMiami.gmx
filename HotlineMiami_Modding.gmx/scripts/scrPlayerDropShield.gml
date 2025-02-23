if sprite_index=sprShieldSnapUzi or sprite_index=sprShieldSnapMP5 or sprite_index=sprShieldSnapDoubleBarrel or sprite_index=sprShieldSnapSilencer or sprite_index=sprShieldSnapScorpion or sprite_index=sprShieldSnapMagnum exit
if reset=1 exit
if energie<8 {
    createDeadBody(false,2,sprEBackMachinegun,dir)
    //my_id.type=objEnemy
    my_id=instance_create(x,y,objPlayerJacket)
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
active=0
}
