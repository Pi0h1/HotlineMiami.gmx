image_angle = random(360);
image_index = floor(random(35));
// If a picked weapon isn't available, re-roll until a weapon that is available is picked
while ((global.newgun[15] == 0 && image_index == 7) ||
       (global.newgun[0] == 0 && image_index == 8) ||
       (global.newgun[8] == 0 && image_index == 9) ||
       (global.newgun[2] == 0 && image_index == 10) ||
       (global.newgun[5] == 0 && image_index == 11) ||
       (global.newgun[12] == 0 && image_index == 12) ||
       image_index == 13 ||
       image_index == 14 ||
       (global.newgun[13] == 0 && image_index == 15) ||
       image_index == 16 || image_index == 17 ||
       (global.newgun[3] == 0 && image_index == 18) ||
       (global.newgun[9] == 0 && image_index == 19) ||
       image_index == 20 ||
       image_index == 21 ||
       image_index == 22 ||
       image_index == 23 ||
       image_index == 24 ||
       image_index == 25 ||
       image_index == 26 ||
       (global.newgun[14] == 0 && image_index == 27) ||
       (global.newgun[1] == 0 && image_index == 28) ||
       (global.newgun[4] == 0 && image_index == 29) ||
       (global.newgun[7] == 0 && image_index == 30) ||
       (global.newgun[10] == 0 && image_index == 31) ||
       (global.newgun[6] == 0 && image_index == 32) ||
       (global.newgun[11] == 0 && image_index == 33) ||
       image_index == 34) {
    image_index = floor(random(35));
}
ammo = 0;
// If using Charlie, only pick from specific melee weapons
if (global.maskindex == 17)
    image_index = choose(2, 3, 4, 5);
// If using Aubrey, only pick from specific guns
if (global.maskindex == 3)
    image_index = choose(0, 1, 6);

// Set ammo based on image index (always gun)
switch (image_index) {
    case  0: ammo = 24; break;
    case  1: ammo =  6; break;
    case  6: ammo =  2; break;
    case  7: ammo = 13; break;
    case  9: ammo = 30; break;
    case 10: ammo =  6; break;
    case 11: ammo = 20; break;
    case 12: ammo = 32; break;
}

image_speed = 0;
dir = random(360);

