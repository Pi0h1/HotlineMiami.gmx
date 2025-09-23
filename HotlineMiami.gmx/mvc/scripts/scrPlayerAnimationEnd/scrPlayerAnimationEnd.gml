image_speed = 0;
if (sprite_index == sprPUnlockDoor) {
    my_id = instance_create(x, y, objPlayerMouse);
    my_id.ammo = ammo;
    global.maskon = 1;
    my_id.maskon = 1;
    instance_destroy();
    exit;
}
if (sprite_index == sprPHeadExplode) {
    instance_destroy();
    objEffector.brus = 10;
    with (objDreamPlayer) {
        alarm[0] = 100;
    }
    exit;
}
if (sprite_index == sprPigButcherAttack) {
    sprite_index = sprPigButcher;
    left = -left;
}

// Weapon Attack to Walk
switch (sprite_index) {
    
    // Guns
    case sprPAttackM16: sprite_index = sprPWalkM16; break;
    case sprPAttackShotgun: sprite_index = sprPWalkShotgun; break;
    case sprPAttackDoubleBarrel1: sprite_index = sprPWalkDoubleBarrel; break;
    case sprPAttackDoubleBarrel2: sprite_index = sprPWalkDoubleBarrel; break;
    case sprPAttackSilencer: sprite_index = sprPWalkSilencer; break;
    case sprPAttackUzi: sprite_index = sprPWalkUzi; break;
    case sprPAttackSilencedUzi: sprite_index = sprPWalkSilencedUzi; break;
    case sprPAttackMagnum: sprite_index = sprPWalkMagnum; break;
    case sprPAttackScorpion: sprite_index = sprPWalkScorpion; break;
    case sprPAttackMP5: sprite_index = sprPWalkMP5; break;
    
    // Melee; 
    // ( left = -left ) means flip sprite after attack
    case sprPAttackCrowbar: sprite_index = sprPWalkCrowbar; left = -left; break;
    case sprPAttackPan: sprite_index = sprPWalkPan; left = -left; break;
    case sprPAttackPool: sprite_index = sprPWalkPool; left = -left; break;
    case sprPAttackPoolBroke: sprite_index = sprPWalkPoolBroke; break;
    case sprPAttackAxe: sprite_index = sprPWalkAxe; left = -left; break;
    case sprPAttackSledgeHammer: sprite_index = sprPWalkSledgeHammer; left = -left; break;
    case sprPAttackPot: sprite_index = sprPWalkPot; left = -left; break;
    case sprPAttackBoilingPot: sprite_index = sprPWalkBoilingPot; left = -left; break;
    case sprPAttackMachete: sprite_index = sprPWalkMachete; left = -left; break;
    case sprPAttackKnife: sprite_index = sprPWalkKnife; left = -left; break;
    case sprPAttackSword: sprite_index = sprPWalkSword; left = -left; break;
    case sprPAttackBat: sprite_index = sprPWalkBat; left = -left; break;
    case sprPAttackClub: sprite_index = sprPWalkClub; left = -left; break;
    case sprPAttackPipe: sprite_index = sprPWalkPipe; left = -left; break;
    case sprPAttackPunch: sprite_index = sprPWalkUnarmed; left = -left; break;
    case sprPAttackBag: sprite_index = sprPWalkBag; left = -left; break;
    case sprPAttackDrill: sprite_index = sprPWalkDrill; left = -left; break;
    case sprPAttackTrophy: sprite_index = sprPWalkTrophy; left = -left; break;
    case sprPAttackNightStick: sprite_index = sprPWalkNightStick; left = -left; break;
    
    // Misc
    case sprPAttackThrow: sprite_index = sprPWalkUnarmed; break;
}

// Set masmk abilities after play puts on mask animation (note: must also edit scrGetMaskPowers for abilities to transfer over when dying on the first floor)
if (sprite_index == sprPMaskSlip) {
    sprite_index = sprPWalkUnarmed;
    maskon = 1;
    global.maskon = 1;
    
    if (global.maskindex == 9)
        energie = 1;
    if (global.maskindex == 21)
        energie = 2;
    if (global.maskindex == 6) {
        if (room == rmPoliceHQFloor1)
            sprite_index = sprPWalkNightStick;
        else sprite_index = sprPWalkKnife;
        ammo = 0;
    }
    if (global.maskindex == 23) {
        sprite_index = sprPWalkDrill;
        ammo = 0;
    }
    if (global.maskindex == 3) {
        with (objWeapon) {
            if (object_index == objWeapon) {
                image_index = choose(0, 1, 6);
                scrGunIndexGetAmmo(image_index);
            }
        }
    }
    if (global.maskindex == 17) {
        with (objWeapon) {
            if (object_index == objWeapon) {
                image_index = choose(2, 3, 4, 5);
                ammo = 0;
            }
        }
    }
    if (global.maskindex == 25) {
        sprite_index = sprPWalkSilencedUzi;
        global.usedgun[8] = 1;
        ammo = 30;
    }
    global.usedmask[global.maskindex] = 1;
}
if (sprite_index == sprPLeaveBag) {
    sprite_index = sprPWalkUnarmed;
    maskon = 1;
    global.maskon = 1;
}
