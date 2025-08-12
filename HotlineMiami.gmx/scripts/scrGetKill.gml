switch (argument0) {
    case sprPWalkKnife: case sprPAttackKnife:
        global.usedkill[3] = 1;
        return objPKnifeKill;

    case sprPWalkMachete: case sprPAttackMachete:
        global.usedkill[10] = 1;
        return objPMacheteKill;        

    case sprPWalkBoilingPot: case sprPAttackBoilingPot:
        global.usedkill[14] = 1;
        return objPBoilingPotKill;

    case sprPWalkSledgeHammer: case sprPAttackSledgeHammer:
        global.usedkill[11] = 1;
        return objPSledgeKill;

    case sprPWalkAxe: case sprPAttackAxe:
        global.usedkill[7] = 1;
        return objPAxeKill;

    case sprPWalkSword: case sprPAttackSword:
        global.usedkill[4] = 1;
        return objPSwordKill;

    case sprPWalkPoolBroke: case sprPAttackPoolBroke:
        global.usedkill[6] = 1;
        return objPBrokenPoolKill;

    case sprPWalkPool: case sprPAttackPool:
        global.usedkill[5] = 1;
        return objPPoolKill;

    case sprPWalkDrill: case sprPAttackDrill:
        global.usedkill[12] = 1;
        return objPDrillKill;

    case sprPWalkNightStick: case sprPAttackNightStick:
        global.usedkill[8] = 1;
        return objPBluntKill;

    case sprPWalkBat: case sprPAttackBat:
    case sprPWalkCrowbar: case sprPAttackCrowbar:
    case sprPWalkClub: case sprPAttackClub:
    case sprPWalkPan: case sprPAttackPan:
    case sprPWalkPot: case sprPAttackPot:
    case sprPWalkPipe: case sprPAttackPipe:
    case sprPWalkBag: case sprPAttackBag:
        return objPBluntKill;
}

if (argument0 == sprPWalkThrow) {
    switch (objPlayer.throwindex) {
        case 0: global.usedkill[16] = 1; return objPScissorKill;
        case 1: global.usedkill[17] = 1; return objPBottleKill;
        case 3: global.usedkill[18] = 1; return objPBrickKill;
        case 5: global.usedkill[19] = 1; return objPHammerKill;
        case 6: global.usedkill[20] = 1; return objPDartKill;
    }
}
global.test = 1;
return objEnemyBash;
