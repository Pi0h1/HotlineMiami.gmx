if state=0 {
if image_index<9 image_index+=0.2 else {state=1 sprite_index=sprBoss2Walk}
if image_index>=5 {
with objPlayerBoss {
if state=5 {
sprite_index=sprPStomped
audio_play_sound(sndDoorHit,0,false)
image_angle=point_direction(objPlayerBikerKick.x,objPlayerBikerKick.y,x,y)
direction=image_angle
speed=3
depth=1
friction=0.25 
image_index=0 
state=6
}
}
}
}

if state=1 {
image_index+=0.15
legindex+=0.25
direction=point_direction(x,y,objPlayerBoss.x,objPlayerBoss.y)
image_angle=direction
speed=1
if point_distance(x,y,objPlayerBoss.x,objPlayerBoss.y)<2 {
speed=0
direction=point_direction(x,y,objPlayerBoss.x,objPlayerBoss.y)
state=2
scrGetMessage(3)
legindex=0
}
}

if state=2 {
if !instance_exists(objPhoneConversation) {
if sprite_index=sprBoss2Walk {
sprite_index=sprBikerKick
image_index=0
}
if image_index<9 image_index+=0.25 else {global.done=1 instance_create(x,y,objLevelComplete) with objElevator valid=1 my_id=instance_create(x,y,objPlayerBiker) with objDoorH solid=0 with objDoorH2 solid=0 instance_destroy()}
if image_index>=5 {
if objPlayerBoss.image_index=0 {
objPlayerBoss.image_index=1
audio_play_sound(sndPunch,0,false)
audio_play_sound(sndHit,0,false)
with objPlayerBoss {
global.shake=8
repeat (3+random(3)) {
instance_create(x+lengthdir_x(21,image_angle)-1+random(2),y+lengthdir_y(21,image_angle)-1+random(2),objBloodSquirt)
}
repeat (4) {
my_id=instance_create(x+lengthdir_x(21,image_angle)-1+random(2),y+lengthdir_y(21,image_angle)-1+random(2),objBloodSmoke)
my_id.direction=random(360)
my_id.speed=random(3)
my_id.image_angle=my_id.direction
}
}
}
if objPlayerBoss.image_index<3 objPlayerBoss.image_index+=0.25
}
}
}

