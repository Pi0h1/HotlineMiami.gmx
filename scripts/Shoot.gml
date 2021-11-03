//Shoot(Sound, Speed, Delay, Screenshake, Silenced, Go through enemies, type)

PlaySFX            (argument0) 
sprite_index    =   asset_get_index(string_replace(sprite_get_name(sprite_index),"Walk","Attack"))
image_index     =   0
image_speed     =   argument1
reload          =   argument2
global.shake    =   argument3
ammo-=1
light           =   12
silenced        =   argument4
CreateBullet       (argument5)
CreateShell        (argument6)

if silenced=false {scrHearPlayer()}
