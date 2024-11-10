/// Ammo
if (sprite_index == sprEWalkShotgun)
{
    ammo = 6;
}

if (sprite_index == sprEWalkDoubleBarrel)
{
    ammo = 2;
}

if (sprite_index == sprEWalkSilencer)
{
    ammo = 13;
}

if (sprite_index == sprEWalkM16)
{
    ammo = 24;
}

if (global.maskindex == 10)
{
    ammo = ceil(ammo * 1.33);
}
