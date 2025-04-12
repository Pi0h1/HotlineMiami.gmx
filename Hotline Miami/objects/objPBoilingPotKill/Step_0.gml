if image_index<13 image_index+=0.15 else {
my_id=instance_create(x,y,objDeadBody)
my_id.image_angle=image_angle
my_id.sprite_index=sprEDeadBoiling
my_id.image_index=0
my_id.image_speed=0.15
my_id=instance_create(x,y,objPlayerMouse)
my_id.sprite_index=sprPWalkPot
my_id.maskon=global.maskon
my_id.maskindex=global.maskindex
global.angle=image_angle-180
my_id.reload=30
with my_id move_outside_solid(global.angle,16)
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
ds_list_add(global.bonuslist,"Execution")
if global.combotime<12 global.combotime=12
exit
}
if image_index>=4 and bled=0 {
bled=1
audio_play_sound(sndBoilingWater,0,false)
my_id=instance_create(x+lengthdir_x(20,image_angle),y+lengthdir_y(20,image_angle),objBloodPool)
my_id.image_alpha=0.5
my_id.image_index=19
my_id.image_blend=c_aqua

repeat (4) {
my_id=instance_create(x+lengthdir_x(20,image_angle),y+lengthdir_y(20,image_angle),objSteam)
my_id.image_speed=0.15
my_id.image_angle=random(360)
my_id.image_alpha=0.15
}
}
if image_index>=4 {
if round(random(3))=2 {
my_id=instance_create(x+lengthdir_x(20,image_angle),y+lengthdir_y(20,image_angle),objSteam)
}
my_id.image_speed=0.15
my_id.image_angle=random(360)
my_id.image_alpha=0.15
if hurtindex<13 hurtindex+=0.2 else hurtindex=6
}

