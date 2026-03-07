if argument0=sprPAttackM16 or argument0=sprPoliceWalkM16 or argument0=sprEM16Crouching return 0
if argument0=sprPAttackShotgun or argument0=sprPoliceWalkShotgun return 1
if argument0=sprPAttackPipe return 3 
if argument0=sprPAttackClub return 2
if argument0=sprPAttackBat return 4
if argument0=sprPAttackKnife return 5
if argument0=sprPAttackDoubleBarrel1 return 6
if argument0=sprPAttackDoubleBarrel2 return 6
if argument0=sprPAttackSilencer return 7
if argument0=sprPAttackSword return 8
if argument0=sprPAttackUzi return 9
if argument0=sprPAttackSilencedUzi return 25
if argument0=sprPAttackMagnum return 10
if argument0=sprPAttackScorpion return 11
if argument0=sprPAttackMP5 return 12
if argument0=sprPAttackPool return 13
if argument0=sprPAttackPoolBroke return 14
if argument0=sprPAttackAxe return 15
if argument0=sprPAttackNightStick return 16
if argument0=sprPoliceAttackNightStick return 16
if argument0=sprPAttackDrill return 21
if argument0=sprPAttackPan return 22
if argument0=sprPAttackBoilingPot return 23
if argument0=sprPAttackPot return 24
if argument0=sprPAttackMachete return 18
if argument0=sprPAttackSledgeHammer return 19
if argument0=sprPAttackCrowbar return 17


if argument0=sprPHumanShieldDoubleBarrel return 6
if argument0=sprPHumanShieldSilencer return 7
if argument0=sprPHumanShieldUzi return 9
if argument0=sprPHumanShieldMagnum return 10
if argument0=sprPHumanShieldScorpion return 11
if argument0=sprPHumanShieldMP5 return 12
if argument0=sprWaiterWalkUzi or argument0=sprWaiterWalkFood or argument0=sprWaiterWalkWine return 9

if argument0=sprPHumanShieldDoubleBarrelShoot1 return 6
if argument0=sprPHumanShieldDoubleBarrelShoot2 return 6
if argument0=sprPHumanShieldSilencerShoot return 7
if argument0=sprPHumanShieldUziShoot return 9
if argument0=sprPHumanShieldMagnumShoot return 10
if argument0=sprPHumanShieldScorpionShoot return 11
if argument0=sprPHumanShieldMP5Shoot return 12

if argument0=sprPWalkM16 return 0
if argument0=sprPWalkShotgun return 1
if argument0=sprPWalkPipe return 3 
if argument0=sprPWalkClub return 2
if argument0=sprPWalkBat return 4
if argument0=sprPWalkKnife return 5
if argument0=sprPWalkDoubleBarrel return 6
if argument0=sprPWalkSilencer return 7
if argument0=sprPWalkSword return 8
if argument0=sprPWalkUzi return 9
if argument0=sprPWalkSilencedUzi return 25
if argument0=sprPWalkMagnum return 10
if argument0=sprPWalkScorpion return 11
if argument0=sprPWalkMP5 return 12
if argument0=sprPWalkPool return 13
if argument0=sprPWalkPoolBroke return 14
if argument0=sprPWalkAxe return 15
if argument0=sprPWalkNightStick return 16
if argument0=sprPoliceWalkNightStick return 16
if argument0=sprPWalkDrill return 21
if argument0=sprPWalkPan return 22
if argument0=sprPWalkBoilingPot return 23
if argument0=sprPWalkPot return 24
if argument0=sprPWalkMachete return 18
if argument0=sprPWalkSledgeHammer return 19
if argument0=sprPWalkCrowbar return 17

if argument0=sprEAttackM16 return 0
if argument0=sprEAttackShotgun return 1
if argument0=sprEAttackPipe return 3 
if argument0=sprEAttackClub return 2
if argument0=sprEAttackBat return 4
if argument0=sprEAttackKnife return 5
if argument0=sprEAttackDoubleBarrel1 return 6
if argument0=sprEAttackDoubleBarrel2 return 6
if argument0=sprEIdlePeeStop or argument0=sprEIdlePee or argument0=sprEnemySit or argument0=sprEIdleSmoke or argument0=sprEStandGuard or argument0=sprEDrinking return round(random(6))


if argument0=sprEWalkM16 return 0
if argument0=sprEWalkShotgun return 1
if argument0=sprEWalkPipe return 3 
if argument0=sprEWalkClub return 2
if argument0=sprEWalkBat return 4
if argument0=sprEWalkKnife return 5
if argument0=sprEWalkDoubleBarrel return 6
if argument0=sprEWalkSilencer return 7

if argument0=sprESearchM16 return 0
if argument0=sprESearchShotgun return 1
if argument0=sprESearchPipe return 3 
if argument0=sprESearchClub return 2
if argument0=sprESearchBat return 4
if argument0=sprESearchKnife return 5
if argument0=sprESearchDoubleBarrel return 6
if argument0=sprESearchSilencer return 7
if argument0=sprPoliceSearchM16 return 0
if argument0=sprPoliceSearchShotgun return 1
if argument0=sprPoliceSearchNightStick return 16 
if argument0=sprPWalkTrophy return 20
if argument0=sprPAttackTrophy return 20

if argument0=sprPWalkThrow return 27+throwindex
if argument0=sprPWalkUnarmed or argument0=sprPAttackPunch or argument0=sprPAttackThrow  return -123
if argument0=sprPigButcher or argument0=sprPigButcherAttack return -123
return -123
