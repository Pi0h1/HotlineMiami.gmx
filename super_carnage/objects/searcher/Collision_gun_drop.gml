if door_hit=0 and armed=0
{
if armed=0 sound_play(click)
armed=1
sprite_index=soldier
with other instance_destroy()
}
