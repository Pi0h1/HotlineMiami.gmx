if (global.xbox)
    scrInitXboxButtons();
energie = 1 + floor(random(4));
image_index = 3;
image_speed = 0;
ammo = 0;
scrInitMaskPos();
scrUpdateMaskPos(sprPAttackBash);
maskindex = global.maskindex;

