scrMoveSolidOn()
if sprite_index=sprEWalkUnarmed scrGoGetWeapon()

if reload>0 reload-=1
if sprite_index=sprEWalkUnarmed nothing=0 else global.factor+=sign(alert)
if path_index>0 {
if image_speed<0.2 image_speed=0.2 
if path_position=1 {path_end() scrReturnToStart()}
} else {
if image_speed<speed*0.1 image_speed=speed*0.1
if !place_free(x,y) {
tempdir=direction
i=1
while (!place_free(x+lengthdir_x(4+i/20,tempdir),y+lengthdir_y(4+i/20,tempdir))) and i<100 {
tempdir+=18
i+=1
}
if i<100 move_outside_solid(tempdir,4+i/20)
}

}

if image_speed>=0.5 {
if place_meeting(x+lengthdir_x(16,angle),y+lengthdir_y(16,angle),objPlayer) {
global.my_id=id
scrPlayerDieMelee()
}
}
scrMoveSolidOff()

if !instance_exists(objPlayer) {alert=0 direction=round(direction*(1/10))*10 speed=0 image_speed=0 exit}
scrSeePlayerStationary()

if alert=2 {checkreload=10 scrChasePlayer() alert=0}

friction=0
if alert=1 {
mask_index=sprWeaponMask
if !place_free(x+hspeed,y+vspeed) speed=0
mask_index=sprMask
if point_distance(x,y,objPlayer.x,objPlayer.y)>16 {motion_add(point_direction(x,y,objPlayer.x,objPlayer.y),0.1) friction=0} else friction=0.5
if place_meeting(x+hspeed,y+vspeed,objShootThrough) {speed=0 scrChasePlayer() alert=0 checkreload=100 exit}
if speed>3 speed=3
direction=scrRotate(direction,point_direction(x,y,objPlayer.x,objPlayer.y),6)
angle=direction
if checkreload>5 checkreload=5
if reload>0 exit
if point_distance(x,y,objPlayer.x,objPlayer.y)<32 {
audio_play_sound(choose(sndSwing1,sndSwing2),0,false)
sprite_index=scrGetAttack(sprite_index)
image_index=1
image_speed=1
reload=30
}
}

