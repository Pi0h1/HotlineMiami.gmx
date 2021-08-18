angle=direction
if sprite_index=sprDoctorWalk {
scrPatrol()
if point_distance(x,y,objPlayer.x,objPlayer.y)>120 or scrCheckBack(point_direction(objPlayer.x,objPlayer.y,x,y),direction) test=1 else {
test=scrLook(objPlayer.x,objPlayer.y,4)
}
if test=0 or test=2 {
speed=0

if sprite_index=sprDoctorWalk {
sprite_index=sprDoctorPoint
image_index=0
objPlayer.active=0
if global.talked=0 {
scrGetMessage(0)
global.talked=1
global.doctor=id
}
}
}
} else {
direction=scrRotate(direction,point_direction(x,y,objPlayer.x,objPlayer.y),10)
if image_index<6 image_index+=0.15
if !instance_exists(objPhoneConversation) {objEffector.fade=1}
}
