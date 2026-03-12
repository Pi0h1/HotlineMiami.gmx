if object_get_parent(object_index)=objEnemyIdle exit
if sprite_index=sprEWalkSilencer nothing=1 
if sprite_index=sprEWalkM16 sprite_index=choose(sprEWalkM16,sprEWalkShotgun,sprEWalkDoubleBarrel)
if sprite_index=sprEWalkM16 ammo=24
if sprite_index=sprEWalkShotgun ammo=6
if sprite_index=sprEWalkDoubleBarrel ammo=2
if sprite_index=sprEWalkSilencer ammo=13

