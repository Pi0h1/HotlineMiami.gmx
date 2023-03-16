if gettrigger_r()>100 or gettrigger_l()>100 {
if solid=1 {
if place_meeting(x-8,y,objPlayer) {
if objPlayer.sprite_index=sprPWalkHospital {
if global.locked=0 {
objPlayer.x=x-16
objPlayer.y=y+16
objPlayer.sprite_index=sprPKeyLockOpen
objPlayer.image_index=0
objPlayer.active=0
objPlayer.dir=0
solid=0
}
}
}
}
}
