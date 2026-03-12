if image_index<50 image_index+=0.2 else {
instance_destroy()
my_id=instance_create(x,y,objPlayerMouse)
global.maskon=0
my_id.maskon=0
my_id=instance_create(x,y,objVomit)
my_id.image_angle=image_angle
}
if image_index>25 and vomit=0 {
vomit=1
audio_play_sound(sndVomit,0,false)
}

