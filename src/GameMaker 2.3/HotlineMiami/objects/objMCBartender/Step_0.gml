if state=0 {
if instance_exists(objPhoneConversation) state=1
}

if state=1 {
if !instance_exists(objPhoneConversation) state=2
}

if state=2 {
if sprite_index=sprMCShakePig {
image_index=0
image_speed=0
sprite_index=sprMCPushPig
}
if image_index<9 image_index+=0.2 else state=3
if image_index>=5 {if !instance_exists(objBartender) {my_id=instance_create(x+16,y,objBartender) my_id.hspeed=3}}
}

if state=3 {
if objBartender.talked=1 and !instance_exists(objPhoneConversation) {
my_id=instance_create(x,y,objPlayerBikerHouse)
instance_destroy()
}
}
