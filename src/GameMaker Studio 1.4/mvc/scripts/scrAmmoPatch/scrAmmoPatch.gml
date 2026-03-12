/*  Do an extra check to see if a weapon really does have the correct amount of ammo.
    Necessary since BTPP messes the logic up at one point and you find things
    like shotguns with 24 ammo.*/

var detectedSuspiciousAmount = (ammo >= 24);    

if (detectedSuspiciousAmount) {
    switch (sprite_index) {
        case sprEWalkM16:           ammo = 24;  break;
        case sprEWalkShotgun:       ammo = 6;   break;
        case sprEWalkDoubleBarrel:  ammo = 2;   break;
        case sprEWalkSilencer:      ammo = 13;  break;
        case sprWeapons:
            switch (image_index) {
                case 1:     ammo = 6;   break;
                case 6:     ammo = 2;   break;
                case 7:     ammo = 13;  break;
                case 9:     ammo = 30;  break;
                case 10:    ammo = 6;   break;
                case 11:    ammo = 20;  break;
                case 12:    ammo = 32;  break;
                default:    ammo = 24;  break;
            }
        break;
        default:                    ammo = 24;  break;
    }
}
scrExtraAmmoPerk();
