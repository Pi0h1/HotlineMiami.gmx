// Returns the weapon index based on currently held weapon.
// scrCurrentWeaponExt() is essentially the same thing but extended, almost virtually no reason to use this.
switch (objPlayer.sprite_index) {
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
    
    case sprPAttackM16: return 0;
    case sprPAttackShotgun: return 1;
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
    case sprPAttackThrow: return 27 + throwindex;
    
    case sprPWalkUnarmed:
    case sprPAttackPunch:
    return -123;
}

