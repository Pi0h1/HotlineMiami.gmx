if on=0
{
sound_play(bottle_hit)
instance_destroy()
instance_create(x,y,shattered_bottle)
if on=1 on=0
dir_change=-dir_change
}

