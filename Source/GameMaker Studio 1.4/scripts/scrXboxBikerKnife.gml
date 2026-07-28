quit=0
if place_meeting(x+lengthdir_x(10,dir),y+lengthdir_y(10,dir),objSecretMask) {
with objSecretMask {
global.masks[image_index]=1
global.newmask[global.newmasks]=image_index
global.newmasks+=1
audio_play_sound(sndToken,0,false)
my_id=instance_create(x,y,objLetterFound)
my_id.text='"'+scrMaskGetName(image_index)+'"'
instance_destroy()
}
quit=1
}
if reload>0 or ammo<=0 nothing=1 else {
if quit=0 {
reload=30
sprite_index=sprBoss2ThrowKnife
image_speed=0.5
ammo-=1
my_id=instance_create(x,y,objThrowingKnife)
global.dir=dir
with my_id {
move_contact_solid(global.dir,12)
}
my_id.direction=dir
my_id.image_angle=dir
my_id.speed=12
audio_play_sound(sndThrow,0,false)
}
}
