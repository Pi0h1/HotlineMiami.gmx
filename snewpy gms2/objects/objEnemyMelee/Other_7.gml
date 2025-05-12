update=0
if sprite_index=sprEAttackClub {sprite_index=sprEWalkClub update=1}
if sprite_index=sprEAttackPipe {sprite_index=sprEWalkPipe update=1}
if sprite_index=sprEAttackBat {sprite_index=sprEWalkBat update=1}
if sprite_index=sprEAttackKnife {sprite_index=sprEWalkKnife update=1}
if update=1 {
image_speed=0
image_yscale=-image_yscale
}

if scrIsSearching(sprite_index) {
sprite_index=scrStopSearch(sprite_index)
image_speed=0
}
