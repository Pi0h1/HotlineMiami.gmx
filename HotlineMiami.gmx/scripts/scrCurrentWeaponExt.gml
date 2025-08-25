// Returns weapon index.
// Like scrCurrentWeapon() but you can pick which sprite index to check (most of the time, objPlayer.sprite_index)
// Use this instead of scrCurrentWeapon() tbh
switch (argument0) {
    case sprPWalkM16: return 0;
    case sprPWalkShotgun: return 1;
    case sprPWalkClub: return 2;
    case sprPWalkPipe: return 3;
    case sprPWalkBat: return 4;
    case sprPWalkKnife: return 5;
    case sprPWalkDoubleBarrel: return 6;
    case sprPWalkSilencer: return 7;
    case sprPWalkSword: return 8;
    case sprPWalkUzi: return 9;
    case sprPWalkMagnum: return 10;
    case sprPWalkScorpion: return 11;
    case sprPWalkMP5: return 12;
    case sprPWalkPool: return 13;
    case sprPWalkPoolBroke: return 14;
    case sprPWalkAxe: return 15;
    case sprPWalkNightStick: return 16;
    case sprPWalkCrowbar: return 17;
    case sprPWalkMachete: return 18;
    case sprPWalkSledgeHammer: return 19;
    case sprPWalkTrophy: return 20;
    case sprPWalkDrill: return 21;
    case sprPWalkPan: return 22;
    case sprPWalkBoilingPot: return 23;
    case sprPWalkPot: return 24;
    case sprPWalkSilencedUzi: return 25;
    case sprPWalkThrow: return 27 + throwindex;

    case sprPAttackM16: case sprPoliceWalkM16: case sprEM16Crouching: return 0;
    case sprPAttackShotgun: case sprPoliceWalkShotgun: return 1;
    case sprPAttackClub: return 2;
    case sprPAttackPipe: return 3;
    case sprPAttackBat: return 4;
    case sprPAttackKnife: return 5;
    case sprPAttackDoubleBarrel1: case sprPAttackDoubleBarrel2: return 6;
    case sprPAttackSilencer: return 7;
    case sprPAttackSword: return 8;
    case sprPAttackUzi: return 9;
    case sprPAttackMagnum: return 10;
    case sprPAttackScorpion: return 11;
    case sprPAttackMP5: return 12;
    case sprPAttackPool: return 13;
    case sprPAttackPoolBroke: return 14;
    case sprPAttackAxe: return 15;
    case sprPAttackNightStick: return 16;
    case sprPAttackCrowbar: return 17;
    case sprPAttackMachete: return 18;
    case sprPAttackSledgeHammer: return 19;
    case sprPAttackTrophy: return 20;
    case sprPAttackDrill: return 21;
    case sprPAttackPan: return 22;
    case sprPAttackBoilingPot: return 23;
    case sprPAttackPot: return 24;
    case sprPAttackSilencedUzi: return 25;
    
    case sprPHumanShieldDoubleBarrel: return 6;
    case sprPHumanShieldSilencer: return 7;
    case sprPHumanShieldUzi: return 9;
    case sprPHumanShieldMagnum: return 10;
    case sprPHumanShieldScorpion: return 11;
    case sprPHumanShieldMP5: return 12;
    
    case sprPHumanShieldDoubleBarrelShoot1: case sprPHumanShieldDoubleBarrelShoot2: return 6;
    case sprPHumanShieldSilencerShoot: return 7;
    case sprPHumanShieldUziShoot: return 9;
    case sprPHumanShieldMagnumShoot: return 10;
    case sprPHumanShieldScorpionShoot: return 11;
    case sprPHumanShieldMP5Shoot: return 12;
    
    case sprEWalkM16: return 0;
    case sprEWalkShotgun: return 1;
    case sprEWalkClub: return 2;
    case sprEWalkPipe: return 3;
    case sprEWalkBat: return 4;
    case sprEWalkKnife: return 5;
    case sprEWalkDoubleBarrel: return 6;
    case sprEWalkSilencer: return 7;

    case sprEAttackM16: return 0;
    case sprEAttackShotgun: return 1;
    case sprEAttackClub: return 2;
    case sprEAttackPipe: return 3;
    case sprEAttackBat: return 4;
    case sprEAttackKnife: return 5;
    case sprEAttackDoubleBarrel1: case sprEAttackDoubleBarrel2: return 6;
    
    case sprESearchM16: return 0;
    case sprESearchShotgun: return 1;
    case sprESearchClub: return 2;
    case sprESearchPipe: return 3;
    case sprESearchBat: return 4;
    case sprESearchKnife: return 5;
    case sprESearchDoubleBarrel: return 6;
    case sprESearchSilencer: return 7;
    
    case sprPoliceSearchM16: return 0;
    case sprPoliceSearchShotgun: return 1;
    case sprPoliceSearchNightStick: return 16;
    
    
    case sprEIdlePeeStop: case sprEIdlePee: case sprEnemySit: case sprEIdleSmoke: case sprEStandGuard: case sprEDrinking: return round(random(6));
    case sprWaiterWalkUzi: case sprWaiterWalkFood: case sprWaiterWalkWine: return 9;
    
    default: return -123;
}
