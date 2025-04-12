if leftthumb_y(0)>10000 {
if active=0 exit
if sprite_index=sprPClimbLedge exit
if sprite_index=sprPWalkWindow {
image_index-=0.2
if y>368 y-=1
image_yscale=-1
}

if sprite_index=sprPWalkLedge {
image_index+=0.2
if y>192 y-=1
image_yscale=1
}
}

if leftthumb_y(0)<-10000 {
if active=0 exit
if sprite_index=sprPClimbLedge exit
if sprite_index=sprPWalkWindow {
image_index+=0.2
if y<528 y+=1
image_yscale=1
}
if sprite_index=sprPWalkLedge {
image_index+=0.2
if y<464 y+=1 else {sprite_index=sprPClimbLedge image_yscale=1 image_index=0}
image_yscale=1
}
}
