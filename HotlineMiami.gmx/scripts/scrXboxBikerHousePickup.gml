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
exit
}

event_perform(ev_mouse,ev_global_left_button)
