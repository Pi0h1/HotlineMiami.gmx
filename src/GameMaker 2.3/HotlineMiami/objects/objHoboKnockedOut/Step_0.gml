scrMoveSolidOn()
if !place_free(x,y) {move_outside_solid(direction-180,8) speed=0}
scrMoveSolidOff()
if speed=0 {
if reload>0 reload-=1 else {
image_speed=0.35
}
}
kill=0
if global.xbox=1 kill=checkbutton(0,getid(11)) else kill=keyboard_check(vk_space)
if kill {
image_xscale=2
image_yscale=2
if place_meeting(x,y,objPlayer) {
if objPlayer.sprite_index=sprPWalkUnarmed or objPlayer.sprite_index=sprPAttackPunch my_id=instance_create(x,y,objPHoboBash)
if objPlayer.sprite_index=sprPWalkBat or objPlayer.sprite_index=sprPAttackBat my_id=instance_create(x,y,objPHoboBlunt)
my_id.image_angle=image_angle
with objPlayerMouse instance_destroy()
instance_destroy()
}
image_xscale=1
image_yscale=1
}
