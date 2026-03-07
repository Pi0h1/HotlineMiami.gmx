if !instance_exists(objPhoneConversation) {
quit=0
if place_meeting(x+lengthdir_x(10,dir),y+lengthdir_y(10,dir),objSecretMask) or place_meeting(x,y,objSecretMask) {
with objSecretMask {
global.masks[image_index]=1
global.newmask[global.newmasks]=image_index
global.newmasks+=1
audio_play_sound(sndToken,0,false)
my_id=instance_create(x,y,objLetterFound)
my_id.text='"'+scrMaskGetName(image_index)+'"'
instance_destroy()
}
quit=1
}

if quit=0 {
if place_meeting(x+lengthdir_x(12,dir),y+lengthdir_y(12,dir),objAnsweringMachine) {
if objAnsweringMachine.active=1 {
scrGetMessage(objAnsweringMachine)
sprite_index=sprPTakePhone
image_index=0
audio_play_sound(sndPhone,0,false)
}
}

if place_meeting(x+lengthdir_x(12,dir),y+lengthdir_y(12,dir),objBox) {
if objBox.sprite_index=sprBox {
objBox.sprite_index=sprBoxOpen
objBox.image_index=1
audio_play_sound(sndBox,0,false)
} else {
with objBox {
audio_play_sound(sndPickupWeapon,0,false)
scrGetMessage(objOpenedBox)
my_id=instance_create(x,y,objOpenedBox)
my_id.image_angle=image_angle
instance_destroy()
global.package=1
global.done=1
}
}
}
}
}
