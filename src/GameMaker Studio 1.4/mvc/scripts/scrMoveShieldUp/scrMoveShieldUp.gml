if energie<9 nothing=1 else {
if persistent=1 and objEffector.fade=1 nothing=1 else {
if sprite_index=sprShieldSnapUzi or sprite_index=sprShieldSnapMP5 or sprite_index=sprShieldSnapDoubleBarrel or sprite_index=sprShieldSnapSilencer or sprite_index=sprShieldSnapScorpion or sprite_index=sprShieldSnapMagnum nothing=1 else {
if instance_exists(objMaskMenu) nothing=1 else {
scrMoveSolidOn()
if place_free(x,y-2) {y-=2} else {
if place_free(x-8,y-2) x-=2 else {
if place_free(x+8,y-2) x+=2
}
}
if image_speed=0 image_index+=0.1
legdir=90 
if keyboard_check(ord("A")) legdir=135
if keyboard_check(ord("D")) legdir=45
legindex+=0.25
legindex2+=0.25
scrMoveSolidOff()
}
}
}
}
