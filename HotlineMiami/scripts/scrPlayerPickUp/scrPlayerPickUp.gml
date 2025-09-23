function scrPlayerPickUp() {
	// This script is for picking up things that aren't weapons on the floor

	if (place_meeting(x, y, objToken)) {
	    with (objToken) {
	        instance_destroy();
	        audio_play_sound(sndToken, 0, false);
	        my_id = instance_create(x, y, objLetterFound);
	        my_id.text = "\"" + scrGetTokenLetter(letter) + "\"";
	        global.letter[letter] = 1;
	    }
	    exit;
	}

	if (place_meeting(x + lengthdir_x(10, dir), y + lengthdir_y(10, dir), objSecretMask) || place_meeting(x, y, objSecretMask)) {
	    with (objSecretMask) {
	        global.masks[image_index] = 1;
	        global.newmask[global.newmasks] = image_index;
	        global.newmasks += 1;
	        audio_play_sound(sndToken, 0, false);
	        my_id = instance_create(x, y, objLetterFound);
	        my_id.text = "\"" + scrMaskGetName(image_index) + "\"";
	        instance_destroy();
	    }
	    exit;
	}

	if (global.masks[24] == 0) {
	    if (place_meeting(x, y, objCobraDead)) {
	        with (objCobraDead) {
	            if (!taken) {
	                taken = 1;
	                global.masks[24] = 1;
	                global.newmask[global.newmasks] = 24;
	                global.newmasks++;
	                audio_play_sound(sndToken, 0, false);
	                my_id = instance_create(x, y, objLetterFound);
	                my_id.text = "\"" + scrMaskGetName(24) + "\"";
	            }
	        }
	        exit;
	    }
	}

	if (place_meeting(x, y, objLocustDead)) {
	    with (objLocustDead) {
	        if (!taken) {
	            taken = 1;
	            global.masks[23] = 1;
	            global.newmask[global.newmasks] = 23;
	            global.newmasks += 1;
	            audio_play_sound(sndToken, 0, false);
	            my_id = instance_create(x, y, objLetterFound);
	            my_id.text = "\"" + scrMaskGetName(23) + "\"";
	        }
	    }
	    exit;
	}

	if (place_meeting(x + lengthdir_x(8, dir), y + lengthdir_y(8, dir), objWalrusDead)) {
	    with (objWalrusDead) {
	        if (!taken) {
	            taken = 1;
	            global.masks[21] = 1;
	            global.newmask[global.newmasks] = 21;
	            global.newmasks += 1;
	            audio_play_sound(sndToken, 0, false);
	            my_id = instance_create(x, y, objLetterFound);
	            my_id.text = "\"" + scrMaskGetName(21) + "\"";
	        }
	    }
	    exit;
	}

	release = 0;
	if (reload > 0)
	    exit;
	if (sprite_index == sprPWalkBag || sprite_index == sprPAttackBag || sprite_index == sprPWalkBossgun || sprite_index == sprPLeaveBag || sprite_index == sprPTakePhone)
	    exit;
	lastweapon = scrCurrentWeaponExt(sprite_index);
	lastammo = ammo;
	global.gotweapon = 0;
	global.exposed = 1;

	global.test = 0;
	if (sprite_index == sprPWalkUnarmed || sprite_index == sprPAttackPunch)
	    noweapon = 1;
	else noweapon = 0;
	with (objWeapon) {
	    if (global.test == 0) {
	        if (point_distance(x, y, objPlayer.x, objPlayer.y) < 32) {
	            if (ammo > 0) {
	                global.etest = 0;
	                with (objEnemy) {
	                    if (sprite_index == sprEWalkUnarmed || sprite_index == sprEGiveUp) {
	                        // do nothing
	                    } else {
	                        if (alert == 1)
	                            global.etest = 1;
	                    }
	                }
	                if (global.etest) {
	                    my_id = instance_create(x, y - 12, objScore);
	                    my_id.text = "+" + string(60 * global.factor) + "pts";
	                    global.myscore += 60 * global.factor;
	                    ds_list_add(global.bonuslist, "Dangerous Pickup");
	                }
	            }
	            reload = 5;
	            global.gotweapon = 1;
	            scrGetWeapon();
	            global.test = 1;
	            objPlayer.ammo = ammo;
	            audio_play_sound(sndPickupWeapon, 0, false);
	            instance_destroy();
	        }
	    }
	}


	if (noweapon)
	    global.test = 4;
	else {
	    if (lastweapon > 26)
	        global.test = 2;
	}


	if (lastweapon < 0)
	    exit;
	if (sprite_index == sprPWalkUnarmed)
	    exit;
	switch (global.test) {
	    case 0:
	    global.dir = dir;
	    my_id = instance_create(x, y, objWeaponThrow);
	    with (my_id)
	        move_contact_solid(global.dir, 12);
	    audio_play_sound(sndThrow, 0, false);
	    my_id.speed = 8;
	    my_id.direction = dir - 5 + random(10);
	    my_id.ammo = lastammo;
	    my_id.image_index = lastweapon;
	    sprite_index = sprPWalkUnarmed;
	    release = 1;
	    break;
    
	    case 1:
	    global.dir = dir;
	    my_id = instance_create(x, y, objWeaponThrow);
	    with (my_id)
	        move_contact_solid(global.dir, 12);
	    audio_play_sound(sndThrow, 0, false);
	    my_id.speed = 8;
	    my_id.direction = dir - 5 + random(10);
	    my_id.ammo = lastammo;
	    my_id.image_index = lastweapon;
	    release = 1;
	    break;
    
	    case 2:
	    global.dir = dir + left * -20;
	    my_id = instance_create(x, y, objThrowingWeapon);
	    with (my_id)
	        move_contact_solid(global.dir, 12);
	    audio_play_sound(sndThrow, 0, false);
	    my_id.speed = 10;
	    my_id.direction = dir - 5 + random(10);
	    my_id.ammo = lastammo;
	    my_id.image_index = lastweapon - 27;
	    global.usedthrow[my_id.image_index] = 1;
	    if (!global.gotweapon)
	        sprite_index = sprPWalkUnarmed;
	    release = 1;
	    break;
	}



}
