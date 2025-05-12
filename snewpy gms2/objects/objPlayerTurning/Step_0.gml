if wait>0 wait-=1 else {
if image_index>2 image_index-=0.25 else {
if image_index<1.9 image_index+=0.1 else image_index=2
}
}

image_angle=point_direction(x,y,mouse_x,mouse_y)

if image_angle<lastangle-8 {if (lastangle-image_angle)*0.5>image_index-2 image_index=2+(lastangle-image_angle)*0.5
if image_index>12.25 {wait=30 image_index=12.25} //else image_index=2
}

if image_angle>lastangle+8 {if image_index-(image_angle-lastangle)*0.25<image_index image_index=image_index-(image_angle-lastangle)*0.25
if image_index<0 {wait=15 image_index=0}
}

lastangle=image_angle


