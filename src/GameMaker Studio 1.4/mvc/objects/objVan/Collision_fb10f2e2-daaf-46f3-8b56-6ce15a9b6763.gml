my_id=instance_create(other.x,other.y,objOfficeDoor)
my_id.direction=point_direction(x,y,other.x+16,other.y)
my_id.speed=2
my_id.image_angle=-35
with other instance_destroy()
image_index=1
audio_play_sound(sndBreakDoor,0,false)
global.shake=16

