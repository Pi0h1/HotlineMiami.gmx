if global.xbox=1 scrXboxHoboBlunt()
if hurtindex=4 {
if image_index=0 {
my_id=instance_create(x,y,objPlayerMouse)
my_id.alarm[2]=160
global.angle=image_angle-180
my_id.reload=10
with my_id move_outside_solid(global.angle,16)
if sprite_index=sprPBatKill my_id.sprite_index=sprPWalkBat
audio_play_sound(sndComplete,0,false)
sxeasy_play(working_directory+"\\Static.mp3")
instance_create(x,y,objLevelComplete)
my_id.maskon=global.maskon
my_id.maskindex=global.maskindex
my_id=instance_create(x+lengthdir_x(11,image_angle),y+lengthdir_y(11,image_angle),objBloodPool)
my_id=instance_create(x,y,objDeadBody)
my_id.sprite_index=sprHoboGround
my_id.image_index=3
my_id.image_angle=image_angle
global.done=1
instance_destroy()
my_id=instance_create(x,y-12,objScore)
my_id.text="+"+string((600)+400*(global.factor))+"pts"
global.myscore+=(600)+400*(global.factor)
global.killscore+=600
global.boldscore+=400*global.factor
global.combotime=240
global.combo+=1
global.killx[global.kills]=x
global.killy[global.kills]=y
global.kills+=1
}
}

