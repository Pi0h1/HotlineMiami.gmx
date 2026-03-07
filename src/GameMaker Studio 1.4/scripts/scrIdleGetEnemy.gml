if object_get_parent(object_index)=objEnemyIdle {
if room=rmTrainstationEntrance sprite_index=sprEWalkKnife else sprite_index=choose(sprEWalkShotgun,sprEWalkM16)
if room=rmTrainstationEntrance sprite_index=sprEWalkKnife else sprite_index=choose(sprEWalkShotgun,sprEWalkM16)
if sprite_index=sprEWalkShotgun ammo=6 else ammo=24
}
