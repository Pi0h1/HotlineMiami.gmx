if global.talked=1 {
if objPlayer.x>x {
global.talked=2
scrGetMessage(1)
objPlayer.active=0
}
}

if instance_exists(objPhoneConversation) and global.talked=2 {
if image_index<5 image_index+=0.2
} else {
if image_index>0 image_index-=0.2
if global.talked=2 objPlayer.active=1
}
