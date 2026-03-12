if !instance_exists(objPlayer) alert=1 else alert=scrLook(objPlayer.x,objPlayer.y,4)

if alert=0 or alert=2 {
direction=scrRotate(direction,point_direction(x,y,objPlayer.x,objPlayer.y),10)
if image_index>0 {direction=dir image_index-=0.25}
} else {
reload=20
if image_index<5 image_index+=0.25
direction=dir
}


if image_index=0 {
if reload>0 {reload-=1 exit}
shake=1
reload=2
my_id=instance_create(x+lengthdir_x(24,direction),y+lengthdir_y(24,direction),objEBullet)
my_id.direction=direction-4+random(8)
my_id.speed=16
my_id.image_angle=my_id.direction
audio_play_sound(sndEM16,0,false)
}

