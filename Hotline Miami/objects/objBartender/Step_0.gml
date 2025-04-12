if state=0 {
if speed<2 {
if image_index=0 {
my_id=instance_create(x+32,y,objMaskDrop)
my_id.sprite_index=sprMaskDropFront
my_id.image_index=3
my_id.hspeed=2.5
image_index=1
}
}
if speed<=0.1 {
if image_index<3 image_index+=0.2 else {scrGetMessage(1) talked=1 state=1}
global.done=1
}
}
