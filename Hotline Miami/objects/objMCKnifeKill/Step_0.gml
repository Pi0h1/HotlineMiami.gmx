if image_index<7 image_index+=0.15 else {
instance_create(x+lengthdir_x(24,image_angle),y+lengthdir_y(24,image_angle),objBloodPool)
my_id=instance_create(x,y,objDeadBody)
my_id.image_angle=image_angle
my_id.sprite_index=sprEFrontSlit
my_id.image_index=floor(random(2))
my_id=instance_create(x,y,objPlayerBiker)
global.angle=image_angle-180
my_id.reload=30
my_id.ammo=ammo
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
hurtindex=1
targetindex=3
audio_play_sound(choose(sndCut1,sndCut2),0,false)
audio_play_sound(sndHit,0,false)
repeat (2+random(2)) {
my_id=instance_create(x+lengthdir_x(18,image_angle)-1+random(2),y+lengthdir_y(18,image_angle)-1+random(2),objBloodSquirt)
my_id.image_angle=image_angle-110+random(20)
}
}


