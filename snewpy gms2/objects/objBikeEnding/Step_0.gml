if global.xbox=1 {
if checkbutton(0,getid(5)) or checkbutton(0,getid(6)) {
if presstart=0 {
presstart=1
scrXboxBikeEndingStart()
} 
} else presstart=0
}

if current_time-start_time>145000 {
image_index=0
sprite_index=sprMCDriveOff
fade=1
}
if sprite_index=sprMCDrive {
if state=0 {
if x<232 hspeed=point_distance(x,y,232,y)*0.1
if hspeed>8 hspeed=8
if hspeed<0.5 hspeed=0.5
if x>=232 state=1
if image_index<3.5 image_index+=0.4 else image_index=0
}

if state=1 {
if x>200 hspeed-=0.1 else {
if hspeed<0 hspeed+=0.05 else hspeed=0
}
if hspeed<-1 hspeed=-1
if image_index<3.5 image_index+=0.4 else image_index=0

}
} else hspeed+=0.5

my_id=instance_create(x+16,y,objDriveSmoke)
my_id.hspeed=-8

if round(random(32))=2 {
targety=centery-6+random(12)
}

if y<targety y+=0.1
if y>targety y-=0.1

if state=1 {if credits_y>room_height-80-string_height(string_hash_to_newline(credits)) credits_y-=0.2}
