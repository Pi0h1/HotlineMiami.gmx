if global.xbox=1 scrXboxRestart()
if keyboard_check_pressed(ord(global.restartkey)) event_perform(ev_keypress,ord("R"))
if place_meeting(x,y,objPlayerMouse) {
global.dir=point_direction(x,y,objPlayer.x,objPlayer.y)
with objPlayer {
my_id=instance_create(x,y,objPlayerDead)
my_id.sprite_index=sprPBackCar
my_id.image_angle=global.dir
my_id.speed=3
my_id.direction=global.dir
instance_destroy()
}
}


if speed>0 {
if y>72 {
if brake=0 {
tile=tile_layer_find(-99,320,128)
if tile_exists(tile) tile_delete(tile)
tile=tile_layer_find(-99,384,128)
if tile_exists(tile) tile_delete(tile)
tile=tile_layer_find(-99,320,192)
if tile_exists(tile) tile_delete(tile)
}
}
if y>216 {
if brake=0 {brake=1 audio_play_sound(sndCarSkid,0,false) audio_stop_sound(sndCarThrottle)}
friction=0.38
direction+=speed*0.4
image_angle+=speed*0.45
image_yscale=1
}
}
else {

if !instance_exists(objPlayer) {
if reload>0 exit
}
if solid=0 mp_grid_add_instances(global.grid,objVan,1)
solid=1
if state=0 {
sprite_index=sprVanOpenDoor
if image_index<12 image_index+=0.5 else {
sprite_index=sprVanTop
my_id=instance_create(x,y,objVanBottom)
my_id.image_angle=image_angle
state=1
}
}


if state=1 {
if instance_exists(objPlayer) {
if objPlayer.y>384 {
if objPlayer.y<448 {
if reload>0 reload-=1 else {
reload=2
audio_play_sound(sndM16,0,false)
headx=lengthdir_x(30.2,325.8+image_angle)
heady=lengthdir_y(30.2,325.8+image_angle)
my_id=instance_create(x+headx,y+heady+9,objEBullet)
my_id.direction=point_direction(x+headx,y+heady,objPlayer.x,objPlayer.y)
my_id.speed=12
my_id.image_angle=my_id.direction
}
}
} else {
sprite_index=sprVanDoorsOpen
if image_index<63 image_index+=0.25 else {image_index=0 thrown=0 if instance_number(objEnemy)+instance_number(objKnockedOut)=0 state=3}

if image_index>43 and thrown=0 {
if instance_exists(objPlayer) {
dir=point_direction(x+headx,y+heady,objPlayer.x,objPlayer.y)
dist=point_distance(x+headx,y+heady,objPlayer.x,objPlayer.y)
} else {dir=90 dist=80}
my_id=instance_create(x+headx+lengthdir_x(10,dir),y+heady+lengthdir_y(10,dir),objMolotov)
my_id.limit=dist
my_id.speed=8
my_id.direction=dir
thrown=1
}

if reload>0 reload-=1 else {
if enemies>3 {
enemies-=1
reload=60
if enemies=3 enemy=objEnemyFat else enemy=objEnemyPatrol
my_id=instance_create(x+lengthdir_x(24,image_angle+90),y+lengthdir_y(24,image_angle+90),enemy)
if enemy=objEnemyPatrol {my_id.sprite_index=sprEWalkShotgun my_id.ammo=6}
my_id.direction=90
}
}
}
}
}



if state=3 {

if image_index<63 image_index+=0.25 else {image_index=0 thrown=0 if instance_number(objEnemy)+instance_number(objKnockedOut)=0 state=5}
if image_index>43 and thrown=0 {
if instance_exists(objPlayer) {
dir=point_direction(x+headx,y+heady,objPlayer.x,objPlayer.y)
dist=point_distance(x+headx,y+heady,objPlayer.x,objPlayer.y)
} else {dir=90 dist=80}
my_id=instance_create(x+headx+lengthdir_x(10,dir),y+heady+lengthdir_y(10,dir),objMolotov)
my_id.limit=dist+8
my_id.speed=8
my_id.direction=dir
thrown=1
}


if reload>0 reload-=1 else {
if enemies>0 {
reload=60
enemies-=1
if enemies=2 or enemy=0 enemy=objEnemyFat else enemy=objEnemyPatrol
my_id=instance_create(x+lengthdir_x(24,image_angle+90),y+lengthdir_y(24,image_angle+90),enemy)
if enemy=objEnemyPatrol {my_id.sprite_index=sprEWalkShotgun my_id.ammo=6}
my_id.direction=90
}
}
}




if state=5 {
if instance_exists(objPlayerMouse) {
if instance_number(objEnemy)+instance_number(objKnockedOut)+instance_number(objBurningGuy)=0 {
objEffector.brus=10
with objBottleExplosion {my_id=instance_create(x,y,objBombGround) my_id.image_angle=random(360) instance_destroy()}
with objWeapon instance_destroy()
my_id=instance_create(x+lengthdir_x(24,image_angle+90),y+lengthdir_y(24,image_angle+90),objBoss3)
my_id.direction=90
viewx=camera_get_view_x(view_camera[0])
viewy=camera_get_view_y(view_camera[0])
with objPlayerMouse {
my_id=instance_create(x,y,objPlayerMouseHouse)
my_id.dir=dir
my_id.maskon=1
global.maskon=1
instance_destroy()
}
objPlayer.active=0
camera_set_view_pos(view_camera[0], viewx, viewy)
state=6
sxeasy_play(working_directory+"\\Static.mp3")
}
}
}
}

