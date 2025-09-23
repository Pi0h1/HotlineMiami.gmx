function scrXboxPrisonDoor() {
	if (gettrigger_r() > 100 || gettrigger_l() > 100) {
	    if (!solid || instance_exists(objEnemy) || instance_exists(objKnockedOut))
	        exit;
	    if (!global.locked) {
	        if (place_meeting(x, y + 4, objPlayer)) {
	            solid = 0;
	            audio_play_sound(sndPickupWeapon, 0, false);
	            with (objPlayerMouse) {
	                if (sprite_index == sprPWalkUnarmed || sprite_index == sprPAttackPunch) {
	                    // do nothing
	                } else {
	                    my_id = instance_create(objPlayer.x + lengthdir_x(8, objPlayer.dir + 90), objPlayer.y + lengthdir_y(8, objPlayer.dir + 90), objWeaponThrow);
	                    my_id.image_index = scrCurrentWeaponExt(sprite_index);
	                    my_id.direction = dir + 70 + random(40);
	                    my_id.speed = 1 + random(2);
	                    my_id.ammo = ammo;
	                }

	                my_id = instance_create(x, y + 5, objPlayerMouseHouse);
	                my_id.active = 0;
	                my_id.sprite_index = sprPUnlockDoor;
	                my_id.image_speed = 0.15;
	                my_id.ammo = 0;
	                global.maskon = 1;
	                my_id.maskon = 1;
	                instance_destroy();
	            }
	        }
	    }
	}



}
