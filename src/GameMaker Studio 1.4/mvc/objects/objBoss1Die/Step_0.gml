if image_index<29 image_index+=0.15 else {
instance_create(x+lengthdir_x(24,image_angle),y+lengthdir_y(24,image_angle),objBloodPool)
my_id=instance_create(x,y,objDeadBody)
my_id.image_angle=image_angle
my_id.sprite_index=sprBoss1Dead
my_id=instance_create(x,y,objPlayerMouse)
my_id.maskon=global.maskon
my_id.maskindex=global.maskindex
instance_destroy()
exit
}
if image_index>13 and bled=0{
bled=1
audio_play_sound(sndHit,0,false)
repeat (2+random(3)) {
instance_create(x+lengthdir_x(24,image_angle)-1+random(2),y+lengthdir_y(24,image_angle)-1+random(2),objBloodSquirt)
}
repeat (4) {
my_id=instance_create(x+lengthdir_x(24,image_angle)-1+random(2),y+lengthdir_y(24,image_angle)-1+random(2),objBloodSmoke)
my_id.direction=random(360)
my_id.speed=random(3)
my_id.image_angle=my_id.direction
}
}

