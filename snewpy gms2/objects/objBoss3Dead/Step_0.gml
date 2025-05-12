if objEffector.brus=0 {
if wait>0 {wait-=1 exit}
if sprite_index=sprBoss3Bash {image_index=0 image_speed=0 sprite_index=sprBoss3BreakArm objEffector.brus=10 exit}
if sprite_index=sprBoss3BreakArm {if image_index>8.5 and image_index<8.8 audio_play_sound(sndNeck,0,false) if image_index<11 image_index+=0.25 else {objEffector.brus=10 sprite_index=sprBoss3Dead} exit}
if sprite_index=sprBoss3Dead {if index<18 index+=0.2 else {objPlayer.x=x+18 objPlayer.y=y-18 objEffector.brus=10 sprite_index=sprBoss3Burning image_speed=0.15} 
if index>=6 and index-0.2<6 audio_play_sound(sndLighter,0,false)
if index>=10 and index-0.2<10 audio_play_sound(sndLighter,0,false)
exit}
if sprite_index=sprBoss3Burning {
if round(random(1)) {
my_id=instance_create(x-16+random(32),y-16+random(32),objFlameParticle)
my_id.direction=point_direction(x,y,my_id.x,my_id.y)
my_id.speed=random(1.5)
}
if global.done=0 instance_create(x,y,objGoToCar)
objPlayer.active=1
objPlayer.visible=1
global.done=1
with objPlayerMouseHouse {
instance_destroy()
viewx=camera_get_view_x(view_camera[0])
viewy=camera_get_view_y(view_camera[0])
my_id=instance_create(x,y,objPlayerMouse)
camera_set_view_pos(view_camera[0], viewx, viewy)
my_id.maskon=1
global.maskon=1
}
}
}

