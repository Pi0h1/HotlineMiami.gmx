if startspeed=0.1 and speed>0 startspeed=speed
image_blend=merge_color(c_ltgray,c_white,speed*(1/startspeed))
image_angle+=rotspeed
if speed=0 {
rotspeed=0;
}

