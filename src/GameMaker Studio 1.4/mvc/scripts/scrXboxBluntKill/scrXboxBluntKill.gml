if gettrigger_r()>100 {
if pressrtrig=0 {
pressrtrig=1
if image_index=0 and hurtindex=targetindex and targetindex<11{
if targetindex=8 targetindex=11
if targetindex=4 targetindex=8
if targetindex=0 {targetindex=4 if global.maskindex=2 {hurtindex=8 targetindex=11}}
hurtindex+=1
image_index=7
audio_play_sound(sndHit,0,false)
audio_play_sound(sndPunch,0,false)
global.shake=4
repeat (1+random(3)) {
instance_create(x+lengthdir_x(18,image_angle-1+random(2)),y+lengthdir_y(18,image_angle-1+random(2)),objBloodSquirt)
}
repeat (4) {
my_id=instance_create(x+lengthdir_x(18,image_angle),y+lengthdir_y(18,image_angle),objBloodSmoke)
my_id.direction=random(360)
my_id.image_angle=my_id.direction
my_id.speed=random(2)
}
if targetindex=11 {
global.shake=6
repeat (4) {
my_id=instance_create(x+lengthdir_x(22,image_angle)-2+random(4),y+lengthdir_y(22,image_angle)-2+random(4),objBloodSmoke)
my_id.direction=point_direction(x,y,my_id.x,my_id.y)
my_id.image_angle=random(360)
my_id.speed=random(1)
}
}
}
}
} else pressrtrig=0
