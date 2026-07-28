switch(argument0) {
    case sprPWalkBat:
    case sprPAttackBat:
  
    case sprPWalkCrowbar:
    case sprPAttackCrowbar:

    case sprPWalkClub:
    case sprPAttackClub:
    
    case sprPWalkPan:
    case sprPAttackPan:
    
    case sprPWalkPot:
    case sprPAttackPot:
    
    case sprPWalkPipe:
    case sprPAttackPipe:
    
    case sprPWalkBag:
    case sprPAttackBag:
        return objPBluntKill;
        break;
    
    case sprPWalkKnife:
    case sprPAttackKnife:
        global.usedkill[3] = true;
        return objPKnifeKill;
        break;
        
    case sprPWalkMachete:
    case sprPAttackMachete:
        global.usedkill[10] = true;
        return objPMacheteKill;
        break;
    
    case sprPWalkSledgeHammer:
    case sprPAttackSledgeHammer:
        global.usedkill[11] = true;
        return objPSledgeKill;
        break;        

    case sprPWalkBoilingPot:
    case sprPAttackBoilingPot:
        global.usedkill[14] = true;
        return objPBoilingPotKill;
        break;
        
    case sprPWalkAxe:
    case sprPAttackAxe:
        global.usedkill[7] = true;
        return objPAxeKill;
        break;
    
    case sprPWalkSword:
    case sprPAttackSword:
        global.usedkill[4] = true;
        return objPSwordKill;
        break;
        
    case sprPWalkPool:
    case sprPAttackPool:
        global.usedkill[5] = true;
        return objPPoolKill;
        break;
        
    case sprPWalkPoolBroke:
    case sprPAttackPoolBroke:
        global.usedkill[6] = true;
        return objPBrokenPoolKill;
        break;
        
    case sprPWalkDrill:
    case sprPAttackDrill:
        global.usedkill[12] = true;
        return objPDrillKill;
        break;
        
    case sprPWalkNightStick:
    case sprPAttackNightStick:
        global.usedkill[8] = true;
        return objPBluntKill;
        break;
    
    case sprPWalkThrow:
            switch(objPlayer.throwindex) {
                case 0: global.usedkill[16] = true; return objPScissorKill  break;
                case 1: global.usedkill[17] = true; return objPBottleKill   break;
                case 6: global.usedkill[20] = true; return objPDartKill     break;
                case 5: global.usedkill[19] = true; return objPHammerKill   break;
                case 3: global.usedkill[18] = true; return objPBrickKill    break;
            }
        break;
        
    case sprPigButcher:
    case sprPigButcherAttack:
    case sprPigButcherWalkMP5:
    case sprPigButcherShoot:
        return objPigButcherKill
        break;
}

global.test = 1;
return objEnemyBash;
