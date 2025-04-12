globalvar check;
scrMoveSolidOn()
if weaponfind=0 {
i=0
target=-1231423
if checkreload>0 checkreload-=1 else {
checkreload=10
global.check=0
while i<instance_number(objWeapon) and global.check=0 {
target=scrInstanceNearest(objWeapon,i)
if instance_exists(target) {
if target.image_index<=7 {
if !scrCollisionLineExt(x,y,target.x,target.y,4,objSolid,objShootThrough,objDoorV) {
global.check=1
weaponfind=1
}
}
}
i+=1
}
}

if weaponfind=0 and instance_exists(objPlayer) {
dist=point_distance(x,y,objPlayer.x,objPlayer.y)
if dist<64 {
dir=point_direction(objPlayer.x,objPlayer.y,x,y)
direction=dir-180
if place_free(x+lengthdir_x(1,dir),y+lengthdir_y(1,dir)) {
x+=lengthdir_x(1,dir)
y+=lengthdir_y(1,dir)
}
image_speed=0.1
}
}

} else {
if !instance_exists(target) {weaponfind=0 speed=0} else {
speed=2 
direction=point_direction(x,y,target.x,target.y)
image_speed=0.2
if place_meeting(x,y,target) {
sprite_index=sprHoboWalkBat
//with my_id scrChasePlayer()
audio_play_sound(sndPickupWeapon,0,false)
with target instance_destroy()
}

if !place_free(x+hspeed*3,y+vspeed*3) {
if !place_free(x+hspeed*3,y) hspeed=-hspeed
if !place_free(x,y+vspeed*3) vspeed=-vspeed
weaponfind=0
}

}
}

scrMoveSolidOff()
exit
