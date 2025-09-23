function scrXboxPlayerKillShield() {
	if (reload > 0 || sprite_index == sprPLeaveBag || sprite_index == sprPTakePhone) {
	    // do nothing
	} else {
	    lastweapon = scrCurrentWeapon();
	    lastammo = ammo;

	    global.executionx = x;
	    global.executiony = y;

	    scrThroatEnemy();
	    if (global.test == 3) {
	        // do nothing
	    } else {
	        global.exposed = 0;
	        release = 0;
	        with (objKnockedOut) {
	            image_xscale = 3;
	            image_yscale = 3;
	        }
	        if (ammo > 0) {
	            if (sprite_index == sprPWalkScorpion || sprite_index == sprPWalkMP5 || sprite_index == sprPWalkMagnum || sprite_index == sprPWalkDoubleBarrel || sprite_index == sprPWalkUzi || sprite_index == sprPWalkSilencer) {
	                if (place_meeting(x, y, objKnockedOut)) {
	                    //to disable human shields, remove code below
                    
	                    /////
                    
	                    my_id = instance_create(x, y, objPlayerShieldMouse);
	                    my_id.dir = dir;
	                    my_id.ammo = ammo;
	                    switch (sprite_index) {
	                        case     sprPWalkScorpion: my_id.sprite_index = sprPHumanShieldScorpion;     break;
	                        case       sprPWalkMagnum: my_id.sprite_index = sprPHumanShieldMagnum;       break;
	                        case sprPWalkDoubleBarrel: my_id.sprite_index = sprPHumanShieldDoubleBarrel; break;
	                        case     sprPWalkSilencer: my_id.sprite_index = sprPHumanShieldSilencer;     break;
	                        case          sprPWalkMP5: my_id.sprite_index = sprPHumanShieldMP5;          break;
	                        case          sprPWalkUzi: my_id.sprite_index = sprPHumanShieldUzi;          break;
	                    }
	                    global.test = 0;
	                    with (objKnockedOut) {
	                        if (global.test == 0) {
	                            if (place_meeting(x, y, objPlayer)) {
	                                if (sprite_index == sprPoliceGetUp)
	                                    global.test = 2;
	                                else {
	                                    global.test = 1;
	                                    instance_destroy();
	                                }
	                            }
	                        }
	                    }
	                    if (global.test == 2) {
	                        with (my_id)
	                            instance_destroy();
	                    } else instance_destroy();
	                    with (objKnockedOut) {
	                        image_xscale = 1;
	                        image_yscale = 1;
	                    }
                    
	                    /////
                    
	                    // comment all code above to here and enable in step event to remove human shields!
	                    quit = 1;
	                }
	            }
	        }

	        global.test = 0;
	        global.drop = 1;


	        if (!quit) {
	            if (place_meeting(x, y, objKnockedOut) && !global.exposed) {
	                with (objKnockedOut) {
	                    image_xscale = 3;
	                    image_yscale = 3;
	                    if (place_meeting(x, y, objPlayer) && global.test == 0) {
	                        global.test = 2;
	                        if (sprite_index == sprEGetUp || sprite_index == sprPoliceGetUp)
	                            my_id = instance_create(x, y, scrGetKill(objPlayer.sprite_index));
	                        if (sprite_index == sprEGetUpLean) {
	                            my_id = instance_create(x, y, objEnemyHeadKick);
	                            if (objPlayer.sprite_index == sprPWalkBag || objPlayer.sprite_index == sprPAttackBag)
	                                my_id.bag = 1;
	                            else my_id.bag = 0;
	                            global.test = 1;
	                        }
	                        if (my_id.object_index == objPBluntKill) {
	                            switch(objPlayer.sprite_index) {
	                                case sprPWalkCrowbar: case sprPAttackCrowbar: my_id.sprite_index = sprPKillCrowbar; break;
	                                case sprPWalkBat: case sprPAttackBat: my_id.sprite_index = sprPBatKill; break;
	                                case sprPWalkPipe: case sprPAttackPipe: my_id.sprite_index = sprPPipeKill; break;
	                                case sprPWalkClub: case sprPAttackClub: my_id.sprite_index = sprPClubKill; break;
	                                case sprPWalkBag: case sprPAttackBag: my_id.sprite_index = sprPBagKill; break;
	                                case sprPWalkPot: case sprPAttackPot: my_id.sprite_index = sprPKillPot; break;
	                                case sprPWalkPan: case sprPAttackPan: my_id.sprite_index = sprPKillPan; break;
	                            }
	                            if (objPlayer.sprite_index == sprPWalkNightStick || objPlayer.sprite_index == sprPAttackNightStick) {
	                                my_id1 = instance_create(x + lengthdir_x(22, image_angle), y + lengthdir_x(22, image_angle), objPoliceHat);
	                                my_id1.direction = image_angle - 10 + random(20);
	                                my_id1.speed = 1 + random(2);
	                                my_id.bottom = sprPoliceBluntKill;
	                                my_id.sprite_index = sprPNightStickKill;
	                            }
	                        }
	                        if (my_id.object_index == objEnemyBash && sprite_index == sprPoliceGetUp) {
	                            my_id1 = instance_create(x + lengthdir_x(22, image_angle), y + lengthdir_x(22, image_angle), objPoliceHat);
	                            my_id1.direction = image_angle - 10 + random(20);
	                            my_id1.speed = 1 + random(2);
	                            my_id.sprite_index = sprPAttackBashPolice;
	                            my_id.maskindex = global.maskindex;
	                        }
	                        my_id.maskon = global.maskon;
	                        my_id.image_angle = angle;
	                        instance_destroy();
	                    }
	                    image_xscale = 1;
	                    image_yscale = 1;
	                }
	                with (objKnockedOut) {
	                    image_xscale = 1;
	                    image_yscale = 1;
	                }
	                if (global.test == 1) {
	                    if (sprite_index == sprPWalkUnarmed || sprite_index == sprPWalkBag || sprite_index == sprPAttackBag) {
	                        // do nothing
	                    } else {
	                        my_id = instance_create(objPlayer.x + lengthdir_x(8, objPlayer.dir + 90), objPlayer.y + lengthdir_y(8, objPlayer.dir + 90), objWeaponThrow);
	                        my_id.image_index = lastweapon;
	                        my_id.direction = dir + 70 + random(40);
	                        my_id.speed = 1 + random(2);
	                        my_id.ammo = lastammo;
	                    }
	                    instance_destroy();
	                    quit = 1;
	                }
	            }

	            if (!quit) {
	                if (global.test == 2) {
	                    with (objKnockedOut) {
	                        image_xscale = 1;
	                        image_yscale = 1;
	                    }
	                    instance_destroy();
	                    quit = 1;
	                }
	            }
	        }
	        with (objKnockedOut) {
	            image_xscale = 1;
	            image_yscale = 1;
	        }
	    }
	}



}
