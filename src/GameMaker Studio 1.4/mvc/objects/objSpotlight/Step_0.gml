image_angle=point_direction(startx,starty,x,y)
if y-16<ylimit1 vspeed=abs(vspeed)
if y+16>ylimit2 vspeed=-abs(vspeed)

if x-16<xlimit1 hspeed=abs(hspeed)
if x+16>xlimit2 hspeed=-abs(hspeed)

if !place_free(x+hspeed*1.5,y) hspeed=-hspeed
if !place_free(x,y+vspeed) y-=vspeed

if round(random(15))=2 direction+=-45+random(90)

h+=1
if h>255 h-=255
color=make_color_hsv(random(255),random(255),255)

image_xscale=1+point_distance(x,y,startx,starty)*(1/256)
image_yscale=image_xscale
if round(random(50+10*speed))=2 {
if speed>0 speed=0 else {speed=4 direction=random(360)}
}
