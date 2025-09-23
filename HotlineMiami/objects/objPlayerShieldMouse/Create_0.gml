image_speed = 0;
currentweapon = 0;
dir = 0;
if (global.xbox)
    scrInitXboxButtons();
myxspeed = 0;
myyspeed = 0;
move = 0;
movex = 0;
movey = 0;

viewspeed = 0;
bullets = 0;
reload = 0;
light = 0;
legdir = 0;
legindex = 0;
legindex2 = 0;
left = 1;
ammo = 0;
energie = 10;
throwreload = 0;
scrInitThrowPos();
scrInitMaskPos();
scrUpdateMaskPos(sprite_index);
last_sprite = sprite_index;
throwindex = 0;
maskindex = global.maskindex;
maskon = global.maskon;
masksprite = -1;
reset = mouse_check_button(mb_right);
shotgunned = 0;
aim = 0;
SteamSetAchievement("ACH_NIGEL_LOWRIE");
snap = 0;

