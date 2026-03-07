with objWindowV {
if x=32 {
if y=352 {
if sprite_index=sprWindowSill nothing=1 else {
if place_meeting(x+16,y,objPlayer) {
with objPlayer instance_destroy()
instance_create(x+16,y+16,objPlayerOpenWindow)
sprite_index=sprWindowSill
image_index=0
instance_create(x,y,objWindowOpen)
}
}
}
}
}

if place_meeting(x,y,objToken) {
with objToken {
instance_destroy()
audio_play_sound(sndToken,0,false)
my_id=instance_create(x,y,objLetterFound)
my_id.text='"'+scrGetTokenLetter(letter)+'"'
global.letter[letter]=1
}
exit
}
