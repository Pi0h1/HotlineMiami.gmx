if other.object_index=objWallSoftH or other.object_index=objWallSoftV {
if speed>0 {
x-=hspeed
y-=vspeed
speed=0
move_contact_all(direction,12)
audio_play_sound(sndHitWall,0,false)
}
}

if other.object_index=objGlassPanelH {
if vspeed>0 {
other.add=-1
} else {
other.add=1
}
with other {
i=0
repeat (24) {
my_id=instance_create(x+i*1.5,y,objShard)
my_id.speed=random(5)
my_id.direction=add*90-8+random(16)
i+=1
}
instance_create(x,y,objGlassPanelHBroken)
instance_destroy()
audio_play_sound(sndGlass1,0,false)
audio_play_sound(sndGlass2,0,false)
audio_play_sound(sndWeaponHit,0,false)
}
exit
}

if other.object_index=objGlassPanelV {
if hspeed>0 {
other.add=-1
} else {
other.add=1
}
with other {
i=0
repeat (24) {
my_id=instance_create(x,y+i*1.5,objShard)
my_id.speed=random(5)
my_id.direction=90+add*90-8+random(16)
i+=1
}
instance_create(x,y,objGlassPanelVBroken)
instance_destroy()
audio_play_sound(sndGlass1,0,false)
audio_play_sound(sndGlass2,0,false)
}
exit
}

