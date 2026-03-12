angle=direction
if instance_exists(objEnemy) {
target=instance_nearest(x,y,objEnemy)
if point_distance(x,y,target.x,target.y)<120 {
check=scrLook(target.x,target.y,4)
if check=0 {
angle=point_direction(x,y,target.x,target.y)
if reload>0 reload-=1 else {
ammo-=1
light=10
global.shake=3
audio_play_sound(sndEM16,0,false)
mask_index=sprWeaponMask
reload=5
if place_meeting(x+lengthdir_x(8,angle),y+lengthdir_y(8,angle),objSolid) {
my_id=instance_create(x,y,objSmokeHit)
my_id.image_angle=image_angle
global.dir=angle
with my_id {
move_contact_solid(global.dir,16)
}
} else {
my_id=instance_create(x+lengthdir_x(32,angle),y+lengthdir_y(32,angle),objBullet)
if instance_exists(my_id) {
my_id.direction=angle-10+random(20)
my_id.speed=12+random(4)
my_id.image_angle=my_id.direction
}
}
my_id=instance_create(x+lengthdir_x(5,angle-5*image_yscale),y+lengthdir_y(5,angle-5*image_yscale),objShell)
my_id.sprite_index=sprM16Shell
my_id.image_angle=angle
my_id.direction=angle-90*image_yscale-20+random(30)
my_id.speed=1+random(3)
mask_index=sprMask
}
}
}
}
if alert=0 {
    
    if instance_exists(objPlayer) scrSearch(objPlayer.x,objPlayer.y,4)
    if alertwait>-1 {if alertwait=0 {path_end() alert=1} alertwait-=1}
    if scrIsSearching(sprite_index) {image_speed=0.2 speed=0 exit}
    if findwall=0 {if speed=0 {speed=1 direction=round(direction*0.1)*10 findwall=1 turn=0} scrSwatFollowWall()} else {
    speed=1 
    turn=0
    direction=round(direction*0.1)*10
    if abs(frac(direction*(1/90)))>0 direction+=diradd*10
    if !place_free(x+hspeed*8,y+vspeed*8) findwall=0
    }
}
if !instance_exists(objPlayer) {if alert>0 findwall=1 alert=0 exit}
if alert<2 and alert>0 {scrCharge(objPlayer.x,objPlayer.y,10,4)}
if alert=2 {scrAim(objPlayer.x,objPlayer.y,10,4)}
if alert=3 {scrChaseSearch(objPlayer.x,objPlayer.y,4)}
scrMoveSolidOff()
