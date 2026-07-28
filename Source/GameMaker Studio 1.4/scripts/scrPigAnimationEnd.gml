image_speed=0
if sprite_index=sprPUnlockDoor {
my_id=instance_create(x,y,objPlayerMouse)
my_id.ammo=ammo
global.maskon=1
my_id.maskon=1
instance_destroy()
exit
}
if sprite_index=sprPHeadExplode {
instance_destroy()
objEffector.brus=10
with objDreamPlayer {
alarm[0]=100
}
exit
}
if sprite_index=sprPigButcherAttack {sprite_index=sprPigButcher left=-left}
if sprite_index=sprPAttackM16 sprite_index=sprPWalkM16
if sprite_index=sprPAttackShotgun sprite_index=sprPWalkShotgun
if sprite_index=sprPAttackDoubleBarrel1 sprite_index=sprPWalkDoubleBarrel
if sprite_index=sprPAttackDoubleBarrel2 sprite_index=sprPWalkDoubleBarrel
if sprite_index=sprPAttackSilencer sprite_index=sprPWalkSilencer
if sprite_index=sprPAttackUzi sprite_index=sprPWalkUzi
if sprite_index=sprPAttackSilencedUzi sprite_index=sprPWalkSilencedUzi
if sprite_index=sprPAttackMagnum sprite_index=sprPWalkMagnum
if sprite_index=sprPAttackScorpion sprite_index=sprPWalkScorpion
if sprite_index=sprPAttackMP5 sprite_index=sprPWalkMP5
if sprite_index=sprPAttackCrowbar {sprite_index=sprPWalkCrowbar left=-left}
if sprite_index=sprPAttackPan {sprite_index=sprPWalkPan left=-left}
if sprite_index=sprPAttackPool {sprite_index=sprPWalkPool left=-left}
if sprite_index=sprPAttackPoolBroke sprite_index=sprPWalkPoolBroke
if sprite_index=sprPAttackAxe {sprite_index=sprPWalkAxe left=-left}
if sprite_index=sprPAttackSledgeHammer {sprite_index=sprPWalkSledgeHammer left=-left}
if sprite_index=sprPAttackPot {sprite_index=sprPWalkPot left=-left}
if sprite_index=sprPAttackBoilingPot {sprite_index=sprPWalkPot left=-left}
if sprite_index=sprPAttackMachete {sprite_index=sprPWalkMachete left=-left}
if sprite_index=sprPAttackKnife {sprite_index=sprPWalkKnife left=-left}
if sprite_index=sprPAttackSword {sprite_index=sprPWalkSword left=-left}
if sprite_index=sprPAttackBat {sprite_index=sprPWalkBat left=-left}
if sprite_index=sprPAttackClub {sprite_index=sprPWalkClub left=-left}
if sprite_index=sprPAttackPipe {sprite_index=sprPWalkPipe left=-left}
if sprite_index=sprPAttackPunch {sprite_index=sprPWalkUnarmed left=-left}
if sprite_index=sprPAttackBag {sprite_index=sprPWalkBag left=-left}
if sprite_index=sprPAttackDrill {sprite_index=sprPWalkDrill left=-left}
if sprite_index=sprPAttackTrophy {sprite_index=sprPWalkTrophy left=-left}
if sprite_index=sprPAttackNightStick {sprite_index=sprPWalkNightStick left=-left}
if sprite_index=sprPAttackThrow {sprite_index=sprPWalkUnarmed}
if sprite_index=sprPMaskSlip {
sprite_index=sprPWalkUnarmed 
maskon=1 
global.maskon=1 
if global.maskindex=9 energie=1
if global.maskindex=21 energie=2
if global.maskindex=6 {if room=rmPoliceHQFloor1 sprite_index=sprPWalkNightStick else sprite_index=sprPWalkKnife ammo=0} 
if global.maskindex=23 {sprite_index=sprPWalkDrill ammo=0}
if global.maskindex=3 {with objWeapon {if object_index=objWeapon {image_index=choose(0,1,6) scrGunIndexGetAmmo(image_index)}}} 
if global.maskindex=17 {with objWeapon {if object_index=objWeapon {image_index=choose(2,3,4,5) ammo=0}}}
if global.maskindex=25 {sprite_index=sprPWalkSilencedUzi global.usedgun[8]=1 ammo=30}
global.usedmask[global.maskindex]=1
}
if sprite_index=sprPLeaveBag {sprite_index=sprPWalkUnarmed maskon=1 global.maskon=1}
