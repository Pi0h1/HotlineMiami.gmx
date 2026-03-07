if argument0=sprPWalkKnife or argument0=sprPAttackKnife {global.usedkill[3]=1 return objPKnifeKill}
if argument0=sprPWalkMachete or argument0=sprPAttackMachete {global.usedkill[10]=1 return objPMacheteKill}
if argument0=sprPWalkBoilingPot or argument0=sprPAttackBoilingPot {global.usedkill[14]=1 return objPBoilingPotKill}
if argument0=sprPWalkSledgeHammer or argument0=sprPAttackSledgeHammer {global.usedkill[11]=1 return objPSledgeKill}
if argument0=sprPWalkBat or argument0=sprPAttackBat or argument0=sprPWalkCrowbar or argument0=sprPAttackCrowbar or argument0=sprPWalkClub or argument0=sprPAttackClub or argument0=sprPAttackPan or argument0=sprPWalkPan or argument0=sprPAttackPot or argument0=sprPWalkPot  or argument0=sprPWalkPipe or argument0=sprPAttackPipe or argument0=sprPWalkBag or argument0=sprPAttackBag return objPBluntKill
if argument0=sprPWalkAxe or argument0=sprPAttackAxe {global.usedkill[7]=1 return objPAxeKill}
if argument0=sprPWalkSword or argument0=sprPAttackSword {global.usedkill[4]=1 return objPSwordKill}
if argument0=sprPWalkPoolBroke or argument0=sprPAttackPoolBroke {global.usedkill[6]=1 return objPBrokenPoolKill}
if argument0=sprPWalkPool or argument0=sprPAttackPool {global.usedkill[5]=1 return objPPoolKill}
if argument0=sprPWalkDrill or argument0=sprPAttackDrill {global.usedkill[12]=1 return objPDrillKill}
if argument0=sprPWalkNightStick or argument0=sprPAttackNightStick {global.usedkill[8]=1 return objPBluntKill}
if argument0=sprPWalkThrow {
if objPlayer.throwindex=0 {global.usedkill[16]=1 return objPScissorKill}
if objPlayer.throwindex=1 {global.usedkill[17]=1 return objPBottleKill}
if objPlayer.throwindex=6 {global.usedkill[20]=1 return objPDartKill}
if objPlayer.throwindex=5 {global.usedkill[19]=1 return objPHammerKill}
if objPlayer.throwindex=3 {global.usedkill[18]=1 return objPBrickKill}
}
global.test=1
return objEnemyBash
