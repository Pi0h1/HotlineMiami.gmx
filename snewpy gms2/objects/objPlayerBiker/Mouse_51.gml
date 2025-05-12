if global.xbox=1 exit
if reload>0 exit
if ammo<=0 exit

if place_meeting(x+lengthdir_x(10,dir),y+lengthdir_y(10,dir),objSecretMask) {
with objSecretMask {
global.masks[image_index]=1
global.newmask[global.newmasks]=image_index
global.newmasks+=1
audio_play_sound(sndToken,0,false)
my_id=instance_create(x,y,objLetterFound)
my_id.text="\""+scrMaskGetName(image_index)+"\""
instance_destroy()
}
exit
}

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

