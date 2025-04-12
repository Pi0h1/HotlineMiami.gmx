if off=0 {
with instance_find(objLetterSocket,currentletter) {
my_id=instance_create(x,y,objLetterDone)
my_id.sprite_index=scrGetLetterSprite(target)
my_id.glowsprite=scrGetGlowSprite(target)
audio_play_sound(sndLetter,0,false)
}
currentletter+=1
if currentletter<16 alarm[0]=5
}

