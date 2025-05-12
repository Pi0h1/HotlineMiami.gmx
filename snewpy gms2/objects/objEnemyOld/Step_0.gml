if sprite_index=sprEWalkUnarmed nothing=0 else global.factor+=sign(alert)
scrMoveSolidOn()
if sprite_index=sprEWalkUnarmed scrGoGetWeapon()
if !place_free(x+hspeed*3,y+vspeed*3) {
if !place_free(x+hspeed*3,y) hspeed=-hspeed
if !place_free(x,y+vspeed*3) vspeed=-vspeed
}
if path_index>0 {
image_speed=0.1
if path_position=1 path_end()
}

scrMoveSolidOff()
if !instance_exists(objPlayer) {alert=0 exit}
scrSeePlayer()



friction=0
if alert=1 {
if point_distance(x,y,objPlayer.x,objPlayer.y)>80 {motion_add(point_direction(x,y,objPlayer.x,objPlayer.y),0.1) friction=0} else friction=0.1
if place_meeting(x+hspeed,y+vspeed,objShootThrough) {speed=0 scrChasePlayer() alert=0 checkreload=100 exit}
if speed>2 speed=2
direction=scrRotate(direction,point_direction(x,y,objPlayer.x,objPlayer.y),6)
angle=direction

if ammo<=0 exit
if point_distance(x,y,objPlayer.x,objPlayer.y)>190 exit
scrEnemyShoot()
}

if alert=2 {
speed=0
image_speed=0
if sprite_index=sprEWalkM16 and reload=0 direction=scrRotate(direction,point_direction(x,y,chasex,chasey)-20+random(40),15) else direction=scrRotate(direction,point_direction(x,y,chasex,chasey),15)
angle=direction

scrEnemyShoot()
}
