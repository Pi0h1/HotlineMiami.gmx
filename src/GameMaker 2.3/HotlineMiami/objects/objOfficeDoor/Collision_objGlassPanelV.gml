instance_create(other.x,other.y,objGlassPanelVBroken)
with other {
i=0
repeat (16) {
my_id=instance_create(x+2,y+i*2,objShard)
if x<other.x my_id.direction=170+random(20) else my_id.direction=-10+random(20)
my_id.speed=1+random(3)
i+=1
}
audio_play_sound(choose(sndGlass1,sndGlass2),0,false)
instance_destroy()
}

