image_speed=0.25
dir_change=-1+round(random(1))*2
life=100+random(100)
sound_play(burning)
if instance_exists(player)
{
my_angle=player.my_angle-180
}
else
{
my_angle=0
}

