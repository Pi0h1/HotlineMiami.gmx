image_angle=scrRotate(image_angle,0,6)

if image_angle=0 {
if wait>0 wait-=1 else {
if objEffector.fade=0 audio_play_sound(sndLadder,0,false)
objEffector.fade=1
objEffector.next=1
objEffector.nextroom=room_previous(room)
if image_index<4 image_index+=0.2
}
}

