if energie<9 nothing=1 else {
if persistent=1 and objEffector.fade=1 nothing=1 else {
if sprite_index=sprShieldSnapUzi or sprite_index=sprShieldSnapMP5 or sprite_index=sprShieldSnapDoubleBarrel or sprite_index=sprShieldSnapSilencer or sprite_index=sprShieldSnapScorpion or sprite_index=sprShieldSnapMagnum nothing=1 else {
if instance_exists(objMaskMenu) nothing=1 else {
scrMoveSolidOn()
if place_free(x+2,y) {x+=2} else {
if place_free(x+2,y-8) y-=2 else {
if place_free(x+2,y+8) y+=2
}
}
if image_speed=0 image_index+=0.1
legdir=0
if keyboard_check(ord("W")) legdir=45
if keyboard_check(ord("S")) legdir=315
legindex+=0.25
legindex2+=0.25
scrMoveSolidOff()
}
}
}
}
