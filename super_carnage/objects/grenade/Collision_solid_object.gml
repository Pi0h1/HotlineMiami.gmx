if on=0
{
if speed>3
{
if object_index=beercan sound_play(throw_hit)
if object_index=beer_bottle sound_play(throw_hit2)
}
move_bounce_solid(0)
speed-=speed/4
if on=1 on=0
dir_change=-dir_change
}
