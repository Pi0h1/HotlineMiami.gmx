/*if abs(swingspeed)>0 exit
if image_angle<-1 {swingspeed=1 exit}
if image_angle>1 {swingspeed=-1 exit}*/
if solid=1 exit
swinger=1
if abs(swingspeed)>3.5 exit
if abs(swingspeed)<2 audio_play_sound(sndDoorOpen,0,false)
if y>other.y and other.x<x {swingspeed=-8 exit}
if y>other.y and other.x>x {swingspeed=8 exit}
if other.x<x+lengthdir_x(32,image_angle+270) swingspeed=-8 else swingspeed=8

/* */
/*  */
