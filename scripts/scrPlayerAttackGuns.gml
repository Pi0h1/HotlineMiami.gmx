if ammo<1 exit
mask_index=sprBullet
image_angle=dir
//Shoot (Sound, Speed, Delay, Screenshake, Silenced, Go through enemies, Type)
if sprite_index=wpnWalkM16              {Shoot(sndM16,0.5,2,3,false,false,      sprM16Shell)}
if sprite_index=wpnWalkShotgun          {ShootShotgun()             }
if sprite_index=sprPWalkDoubleBarrel    {ShootDoubleBarrelShotgun() }
if sprite_index=sprPWalkSilencer        {Shoot(sndSilencer,0.5,10,2,true,false, sprUziShell)}
if sprite_index=sprPWalkUzi             {Shoot(sndUzi,1,1,3,false,false,        sprUziShell)}
if sprite_index=sprPWalkSilencedUzi     {Shoot(sndSilencer,1,2,3,true,false,    sprUziShell)}
if sprite_index=sprPWalkMP5             {Shoot(sndMP5,1,2,3,false,false,        sprUziShell)}
if sprite_index=sprPWalkMagnum          {Shoot(sndMagnum,0.5,8,4,false,true,    sprUziShell)}
if sprite_index=sprPWalkScorpion        {Shoot(sndScorpion,1,2,3,false,false,   sprUziShell)}
scrCheckUsedGuns();
