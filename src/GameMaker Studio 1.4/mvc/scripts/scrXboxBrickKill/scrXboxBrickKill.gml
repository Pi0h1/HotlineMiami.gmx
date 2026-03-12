if gettrigger_r()>100 {
if pressrtrig=0 {
pressrtrig=1
if image_index=0 and hurtindex=targetindex and targetindex<15{
if targetindex=12 targetindex=15
if targetindex=8 targetindex=12
if targetindex=4 targetindex=8
if targetindex=0 targetindex=4
hurtindex+=1
image_index=7
audio_play_sound(sndHit,0,false)
audio_play_sound(sndPunch,0,false)
global.shake=5
repeat (1+random(3)) {
instance_create(x+lengthdir_x(18,image_angle-1+random(2)),y+lengthdir_y(18,image_angle-1+random(2)),objBloodSquirt)
}
repeat (4) {
my_id=instance_create(x+lengthdir_x(18,image_angle),y+lengthdir_y(18,image_angle),objBloodSmoke)
my_id.direction=random(360)
my_id.image_angle=my_id.direction
my_id.speed=random(2)
}
}
}
} else pressrtrig=0
