quit=0

if room=rmHotelSuite {
with objWindowV {
if x=480 {
if y=256 {
if sprite_index=sprWindowSill nothing=1 else {
if place_meeting(x-16,y,objPlayer) {
with objPlayer {
if sprite_index=sprPWalkUnarmed nothing=1 else {
my_id=instance_create(objPlayer.x+lengthdir_x(8,objPlayer.dir-90),objPlayer.y+lengthdir_y(8,objPlayer.dir-90),objWeaponThrow)
my_id.image_index=scrCurrentWeaponExt(sprite_index)
my_id.direction=dir-70-random(40)
my_id.speed=1+random(2)
my_id.ammo=ammo
sprite_index=sprPWalkUnarmed
}
instance_destroy()
}
my_id=instance_create(x-6,y+16,objPlayerOpenWindow)
my_id.sprite_index=sprPClimbWindow
my_id.image_angle=0
with my_id {scrInitMaskPos() scrUpdateMaskPos(sprite_index)}
sprite_index=sprWindowSill
image_index=1
my_id=instance_create(x+6,y,objWindowOpen)
my_id.image_xscale=-1
reload=2
quit=1
}
}
}
}
}
}
if quit=0 scrPlayerShoot()
