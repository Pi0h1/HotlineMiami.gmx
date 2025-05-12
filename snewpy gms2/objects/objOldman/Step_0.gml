if sprite_index=sprOldmanDeath {
if image_index<18 image_index+=0.5
}
if state=0 {
if objPlayer.y<224 {
with objPlayerMouse {
my_id=instance_create(x,y,objPlayerMouseHouse)
my_id.image_index=image_index
my_id.dir=dir
my_id.maskindex=global.maskindex
my_id.maskon=1
my_id.sprite_index=sprite_index
my_id.active=0
my_id.aimon=0
instance_destroy()
}
state=1
}
}

if state=1 {
with objPlayerMouseHouse {
lastx=x
lasty=y
if x<240 x+=1
if y>144 y-=1
scrRotate(dir,point_direction(x,y,objOldman.x,objOldman.y),6)
if lastx==x and lasty==y objOldman.state=2 else {image_index+=0.15 legindex+=0.25 dir=point_direction(lastx,lasty,x,y) legdir=dir}
}
}

if state=2 {
objPlayer.image_index=0
objPlayer.legindex=0
objPlayer.aimon=0
objPlayer.dir=point_direction(objPlayer.x,objPlayer.y,x,y)
scrGetMessage(0)
state=3
wait=100
}

if state=3 {
if !instance_exists(objPhoneConversation) {
if wait>0 wait-=1 else {
objPlayer.sprite_index=sprPAttackBossgun
if objPlayer.image_index<19 objPlayer.image_index+=0.15 else {
state=4 
objPlayer.sprite_index=sprPWalkUnarmed 
objPlayer.image_index=0 
wait=60

with objPlayer {
my_id=instance_create(x+5,y+5,objBossgun)
my_id.friction=0.1
my_id.speed=1
my_id.direction=-45
}
}
if objPlayer.image_index>9 and shoot=0 {
shoot=1 
with objPlayer {
my_id=instance_create(x+lengthdir_x(24,dir),y+lengthdir_y(24,dir),objBullet)
audio_play_sound(sndMagnum,0,false)
my_id.direction=dir
my_id.speed=12
my_id.image_angle=dir
}
}
}
} else {image_index+=0.1}
}

if state=4 {
if wait>0 {wait-=1 sxeasy_setVolume(wait*(1/60)) if wait=0 {sxeasy_setVolume(1) sxeasy_play(working_directory+"\\ElectricDreams.mp3")}} else {
with objPlayer {
lastx=x
lasty=y
if x>224 x-=1
if y>28 y-=1
if lastx==x and lasty==y {objOldman.state=5 wait=20 image_index=0 legindex=0} else {image_index+=0.15 legindex+=0.25 dir=point_direction(lastx,lasty,x,y) legdir=dir}
}
}
}

if state=5 {
if wait>0 {objPlayer.image_index=0 objPlayer.legindex=0 wait-=1} else {
with objPlayer {
sprite_index=sprPThrowMask
global.maskon=0
maskon=0
if image_index<20.85 image_index+=0.15 else {objOldman.wait=30 objOldman.state=6 objPlayer.sprite_index=sprPEnding objPlayer.image_index=0}
if global.throwmask=0 and image_index>16 {my_id=instance_create(x-12,y,objMaskDrop) my_id.direction=180+random(10) my_id.speed=3 my_id.image_angle=270 my_id.sprite_index=sprMaskDropBack global.throwmask=1}
}
}
}

if state=6
{
if wait>0 {objPlayer.image_index=0 objPlayer.legindex=0 wait-=1} else {
objPlayer.sprite_index=sprPEnding
with objPlayer {
if image_index<160 image_index+=0.15
if image_index>=13 and image_index-0.15<13 audio_play_sound(sndLighter,0,false)
if image_index>52 and global.smoke=0 {global.smoke=1 my_id=instance_create(x+lengthdir_x(8,dir),y+lengthdir_y(8,dir),objSmokeHit) my_id.depth=-1 my_id.image_angle=dir my_id.image_speed=0.15}
if image_index>92 and global.smoke=1 {global.smoke=2 my_id=instance_create(x+lengthdir_x(12,dir),y+lengthdir_y(12,dir),objSmokeHit) my_id.depth=-1 my_id.image_angle=dir my_id.image_speed=0.15}
if image_index>122 and global.picture=0 {global.picture=1 my_id=instance_create(x-7,y-13,objPicture) my_id.direction=90 my_id.speed=1.5}
}
}
}

