image_angle+=speed*diradd*10
if on=1 {
if image_index<7 image_index+=0.25
}
image_blend=merge_color(c_ltgray,c_white,speed*0.5)
