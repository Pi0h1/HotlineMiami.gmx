global.shake = 10;
with (objPlayer) {
    pdir = point_direction(global.my_id.x, global.my_id.y, x, y);
    if (global.my_id.sprite_index == sprPInspectorAttack) {
        // do nothing
    } else {
        repeat(8) {
            my_id = instance_create(x - 3 + random(6) + lengthdir_x(8, pdir), y - 3 + random(6) + lengthdir_y(8, pdir), objBloodDrop);
            my_id.image_xscale = 1 - random(0.2);
            my_id.image_yscale = my_id.image_xscale;
            my_id.image_angle = point_direction(x + lengthdir_x(8, pdir), y + lengthdir_y(8, pdir), my_id.x, my_id.y);
            my_id.sprite_index = sprBloodSplatSmall;
            my_id.direction = my_id.image_angle;
            my_id.speed = 2 + random(4);
        }
        repeat(2 + random(3)) {
            my_id = instance_create(x - 3 + random(6) + lengthdir_x(8, pdir), y - 3 + random(6) + lengthdir_y(8, pdir), objBloodDrop);
            my_id.image_xscale = 1 - random(0.2);
            my_id.image_yscale = my_id.image_xscale;
            my_id.image_angle = point_direction(x + lengthdir_x(8, pdir), y + lengthdir_y(8, pdir), my_id.x, my_id.y);
            my_id.direction = my_id.image_angle;
            my_id.speed = 1 + random(5);
        }
        repeat(4) {
            my_id = instance_create(x - 3 + random(6) + lengthdir_x(16, pdir), y - 3 + random(6) + lengthdir_y(16, pdir), objBloodSmoke);
            my_id.image_xscale = 1.2 - random(0.2);
            my_id.image_yscale = my_id.image_xscale;
            my_id.image_angle = pdir - 20 + random(40);
            my_id.direction = my_id.image_angle;
            my_id.speed = 2 + random(1);
            my_id.friction = 0.15;
        }
    }
    my_id = instance_create(x, y, objPlayerDead);
    
    switch (global.my_id.sprite_index) {
        // Blunt
        case sprEAttackClub:
        case sprPAttackClub: // ?? not sure why these are here
        case sprPWalkClub: //  ??
        case sprPWalkPipe: // ??
        case sprPoliceAttackNightStick:
        case sprHoboAttack:
        case sprEAttackBat:
        case sprEAttackPipe:
        
        audio_play_sound(sndHit, 0, false);
        my_id.sprite_index = choose(sprPBackBlunt, sprPBackBlunt, sprPFrontBlunt);
        my_id.image_index = 4 + floor(random(11));
        break;
        
        // Cut
        case sprEAttackKnife:
        case sprPantherHitback:
        case sprBodyguardAttack:
        case sprBoss2AttackCleaver:
        case sprCleaver:
        
        my_id.sprite_index = sprPBackCut;
        my_id.image_index = 2 + floor(random(3));
        audio_play_sound(choose(sndCut1, sndCut2), 0, false);
        break;
        
        // Fat
        case sprEFatAttack:
        case sprBoss1Attack:
        
        my_id.sprite_index = choose(sprPBackBlunt, sprPBackBlunt, sprPFrontBlunt);
        my_id.image_index = 4 + floor(random(11));
        audio_play_sound(sndHit, 0, false);
        audio_play_sound(sndPunch, 0, false);
        break;
        
        // Inspector
        case sprPInspectorAttack:
        
        my_id.sprite_index = sprPBackElectrified;
        my_id.image_speed = 0.25;
        break;
    }
    /*
    if (global.my_id.sprite_index == sprHoboAttack || global.my_id.sprite_index == sprEAttackBat || global.my_id.sprite_index == sprEAttackPipe) {
        audio_play_sound(sndHit, 0, false);
        my_id.sprite_index = choose(sprPBackBlunt, sprPBackBlunt, sprPFrontBlunt);
    }
    
    if (global.my_id.sprite_index == sprEAttackKnife || global.my_id.sprite_index == sprPantherHitback || global.my_id.sprite_index == sprBodyguardAttack || global.my_id.sprite_index == sprBoss2AttackCleaver || global.my_id.sprite_index == sprCleaver) {
        my_id.sprite_index = sprPBackCut;
        audio_play_sound(choose(sndCut1, sndCut2), 0, false);
    }
    if (global.my_id.sprite_index == sprEFatAttack || global.my_id.sprite_index == sprBoss1Attack) {
        my_id.sprite_index = choose(sprPBackBlunt, sprPBackBlunt, sprPFrontBlunt);
        audio_play_sound(sndHit, 0, false);
        audio_play_sound(sndPunch, 0, false);
    }
    
    if (global.my_id.sprite_index == sprPInspectorAttack) {
        my_id.sprite_index = sprPBackElectrified;
        my_id.image_speed = 0.25;
    }
    
    if (global.my_id.sprite_index == sprEAttackClub || global.my_id.sprite_index == sprHoboAttack || global.my_id.sprite_index == sprEAttackBat || global.my_id.sprite_index == sprEAttackPipe || global.my_id.sprite_index == sprEFatAttack || global.my_id.sprite_index == sprBoss1Attack)
        my_id.image_index = 4 + floor(random(11));
    else my_id.image_index = 2 + floor(random(3));
    */
    my_id.direction = pdir;
    my_id.speed = 1.5 + random(1);
    my_id.image_angle = my_id.direction;
    if (object_index == objPlayerBiker || object_index == objMCChopKill || object_index == objMCKnifeKill || object_index == objMCStompKill || object_index == objPlayerBikerHouse) {
        if (my_id.sprite_index == sprPBackBlunt)
            my_id.sprite_index = sprMCBackBlunt;
        if (my_id.sprite_index == sprPFrontBlunt)
            my_id.sprite_index = sprMCFrontBlunt;
        if (my_id.sprite_index == sprPBackCut)
            my_id.sprite_index = sprMCBackCut;
        if (my_id.sprite_index == sprMCBackBlunt || my_id.sprite_index == sprMCFrontBlunt) {
            my_id = instance_create(x + lengthdir_x(24, pdir), y + lengthdir_y(24, pdir), objMCHelmet);
            my_id.direction = pdir - 40 + random(80);
            my_id.speed = 1.5 + random(1);
        }
    } else {
        my_id = instance_create(x + lengthdir_x(24, pdir), y + lengthdir_y(24, pdir), objMaskDrop);
        my_id.direction = pdir - 40 + random(80);
        my_id.speed = 1.5 + random(1);
    }

    if (object_index == objPlayerShieldMouse) {
        my_id = instance_create(x + lengthdir_x(7, dir - 45), y + lengthdir_y(7, dir - 45), objKnockedOut);
        my_id.direction = pdir - 20;
        my_id.speed = 1.5 + random(1);
        my_id.image_angle = my_id.direction;
        my_id.angle = my_id.image_angle;
    }

    if (sprite_index == sprPWalkUnarmed || sprite_index == sprPAttackPunch || object_index == objPlayerBiker || sprite_index == sprPWalkBag || sprite_index == sprPAttackBag || sprite_index = sprPBagKill)
        noweapon = 1;
    else noweapon = 0;
    if (!noweapon) {
        my_id = instance_create(x, y, objWeaponThrow);
        my_id.direction = pdir - 25 + random(50);
        my_id.speed = 2 + random(1);
        my_id.image_index = scrCurrentWeaponExt(sprite_index);
        my_id.ammo = ammo;
        if (image_index < 0)
            with (my_id)
                instance_destroy();
    }
    if (sprite_index == sprPAttackBash) {
        my_id = instance_create(x, y, objKnockedOut);
        my_id.angle = image_angle;
        my_id.type = objEnemy;
    }
    instance_destroy();
}
