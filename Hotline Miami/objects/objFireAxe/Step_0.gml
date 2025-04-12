if image_index=0 {
if place_meeting(x-4,y,objPlayer) {
image_index=1
audio_play_sound(sndDoorOpen,0,false)
my_id=instance_create(x-4,y,objWeapon)
my_id.image_index=15
}
}

