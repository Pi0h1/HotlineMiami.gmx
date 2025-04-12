scrMoveSolidOn()
if alert>0 findwall=1
if sprite_index=sprEWalkUnarmed scrGoGetWeapon()
if sprite_index=sprEWalkUnarmed nothing=0 else global.factor+=sign(alert)
if path_index>0 {
image_speed=0.1
if path_position=1 {path_end() direction=round(direction*0.1)*10}
} else {
if !place_free(x,y) {
tempdir=direction
i=1
while (!place_free(x+lengthdir_x(4+i/20,tempdir),y+lengthdir_y(4+i/20,tempdir))) and i<100 {
tempdir+=18
i+=1
}
if i<100 move_outside_solid(tempdir,4+i/20)
}
if alert=0 {
direction=round(direction*0.1)*10
if speed>0 {
speed=1
friction=0
image_speed=speed*0.1
if !place_free(x+lengthdir_x(speed*16,direction),y+lengthdir_y(speed*16,direction)) {if findwall=0 findwall=1 else {diradd=10 direction+=10}} else {
if findwall=0 {
if place_free(x+lengthdir_x(speed*16,direction-90),y+lengthdir_y(speed*16,direction-90)) {diradd=-10 direction-=10} else {
if frac(direction*(1/90))>0 direction+=diradd
}
}
}
} else {
image_speed=speed*0.1
if !place_free(x+lengthdir_x(16,direction),y+lengthdir_y(16,direction)) direction+=10 else {if frac(direction*(1/90))>0 direction+=10 else speed=1}
}
}
}
scrMoveSolidOff()

if !instance_exists(objPlayer) {alert=0 direction=round(direction*(1/10))*10 exit}
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
if sprite_index=sprEWalkM16 and reload=0 direction=scrRotate(direction,point_direction(x,y,chasex,chasey)-20+random(40),15) else direction=scrRotate(direction,point_direction(x,y,chasex,chasey),15)
angle=direction
if ammo<=0 exit
scrEnemyShoot()
}
