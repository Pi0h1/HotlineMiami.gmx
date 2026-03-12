update=0
if sprite_index=sprPoliceAttackNightStick {update=1 sprite_index=sprPoliceWalkNightStick}
if update=1 {
image_speed=0
image_yscale=-image_yscale
}

if scrIsSearching(sprite_index) {
sprite_index=scrStopSearch(sprite_index)
image_speed=0
}
