if on=1 
{
if swing_angle=-45 or swing_angle=45
{
if player.gun=-2 sound_play(swing_sound)
if swing_angle=-45 swing_speed=10 else swing_speed=-10
}
if swing_speed>0 image_yscale=-1 else image_yscale=1
}

