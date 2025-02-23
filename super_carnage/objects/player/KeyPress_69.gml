if reload>0 exit
sound_play(click2)
if gun=-2 gun=-1
if gun<4 gun+=1 else gun=-1
if gun=1
{
fire_spr=fire2_spr
sprite_index=shotgun_spr
}

if gun=0
{
fire_spr=fire1_spr
sprite_index=subgun_spr
}

if gun=2
{
fire_spr=fire2_spr
sprite_index=sshotgun_spr
}

if gun=3
{
fire_spr=-1
sprite_index=fthrower_spr
}

if gun=4
{
fire_spr=fire1_spr
sprite_index=minigun_spr
}

if gun=-1
{
sprite_index=unarmed
}
