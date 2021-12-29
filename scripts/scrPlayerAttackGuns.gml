if ammo<1 exit
mask_index=sprBullet
image_angle=dir

/* sprite_index = Weapon Sprite
                                        armlength = Pixel distance from the origin point of the sprite at which the bullet shell will be ejected.
                                                        Shoot (Sound,Speed,Delay,Screenshake,Silenced,Go through enemies,Type)*/
if sprite_index=wpnWalkM16              {armlength=5    Shoot(sndM16,0.5,2,3,false,false,      sprM16Shell) }
if sprite_index=wpnWalkShotgun          {armlength=5    ShootShotgun()                                      }
if sprite_index=sprPWalkDoubleBarrel    {armlength=5    ShootDoubleBarrelShotgun()                          }
if sprite_index=sprPWalkSilencer        {armlength=20   Shoot(sndSilencer,0.5,10,2,true,false, sprUziShell) }
if sprite_index=sprPWalkUzi             {armlength=20   Shoot(sndUzi,1,1,3,false,false,        sprUziShell) }
if sprite_index=sprPWalkSilencedUzi     {armlength=20   Shoot(sndSilencer,1,2,3,true,false,    sprUziShell) }
if sprite_index=sprPWalkMP5             {armlength=20   Shoot(sndMP5,1,2,3,false,false,        sprUziShell) }
if sprite_index=sprPWalkMagnum          {armlength=20   Shoot(sndMagnum,0.5,8,4,false,true,    sprUziShell) }
if sprite_index=sprPWalkScorpion        {armlength=20   Shoot(sndScorpion,1,2,3,false,false,   sprUziShell) }
scrCheckUsedGuns();
