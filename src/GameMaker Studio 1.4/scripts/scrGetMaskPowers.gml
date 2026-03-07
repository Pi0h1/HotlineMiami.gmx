if global.maskindex=9 energie=1
if global.maskindex=21 energie=2

//When you die, you will restart with the weapon/power that the mask gived you (on the first floor after you selected it)

//Carl
if global.maskindex=23 sprite_index=sprPWalkDrill

//Aubrey
if global.maskindex=3 {with objWeapon {if object_index=objWeapon image_index=choose(0,1,6)}} 

//Dennis
if global.maskindex=6 {sprite_index=sprPWalkKnife ammo=0} 

//Charlie
if global.maskindex=17 {with objWeapon {if object_index=objWeapon image_index=choose(2,3,4,5)}} 

//Richter
if global.maskindex=25 {sprite_index=sprPWalkSilencedUzi ammo=30} 
