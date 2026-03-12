if state=0 {
if instance_exists(objPhoneConversation) state=1
}

if state=1 {
if !instance_exists(objPhoneConversation) {if wait>0 wait-=1 else {scrGetMessage(1) state=2}}
}

if state=2 {
if !instance_exists(objPhoneConversation) {
my_id=instance_create(x+lengthdir_x(12,image_angle),y+lengthdir_y(12,image_angle),objSushiGuy) 
my_id.on=0
my_id.image_speed=0
my_id.sprite_index=sprSushiGuy
my_id.image_index=3
my_id.direction=image_angle-180
instance_create(x,y,objPlayerBikerHouse)
state=3
global.done=1
instance_create(x,y,objLevelComplete)
instance_destroy()
}
}
