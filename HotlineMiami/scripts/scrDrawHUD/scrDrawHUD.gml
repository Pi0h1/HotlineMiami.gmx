function scrDrawHUD() {
	d3d_set_projection_ortho(0, 0, camera_get_view_width(view_camera[0]), camera_get_view_height(view_camera[0]), 0);

	// Combo logic
	if (global.combo > 0) {
	    // Limit global.combotime so it can't extend infinitely
	    if (global.combotime > 120)
	        global.combotime = 120;
	    // Decrement combo timer
	    if (global.combotime > 0) {
	        global.combotime--;
	        // Decrement combo timer slower if using Zach
	        if (global.maskindex == 13)
	            global.combotime += 0.25;
	    } else {
	        // If combo is more than 1, add to combo.
	        if (global.combo > 1) {
	            global.myscore += (300 + global.combo * 125) * global.combo;
	            global.comboscore += (300 + global.combo * 125) * global.combo;
	            if (instance_exists(objPlayer)) {
	                my_id = instance_create(objPlayer.x, objPlayer.y - 32, objScore);
	                my_id.text = string(global.combo) + "x combo#+" + string((100 + global.combo * 125) * global.combo);
	                if (global.combo >= 4)
	                    SteamSetAchievement("ACH_COMBO_BEGINNER");
	                if (global.combo >= 6)
	                    SteamSetAchievement("ACH_COMBO_INTERMEDIATE");
	                if (global.combo >= 8)
	                    SteamSetAchievement("ACH_COMBO_PRO");
	                if (global.combo >= 10)
	                    SteamSetAchievement("ACH_COMBO_MASTER");
	                if (global.combo >= 12)
	                    SteamSetAchievement("ACH_COMBO_KING");
	                global.comboflash = 1;
	                ds_list_add(global.bonuslist, string(global.combo) + "x combo");
	                if (global.bonustime < 10 + global.combo * 5)
	                    global.bonustime = 10 + global.combo * 5;
	            }
	        }
	        global.combo = 0;
	    }
	} else global.combotime = 0;
	// if you plan on writing the hud from scratch, I recommend keeping all of the above


	if (global.drawscore < global.myscore)
	    update = 1;
	else update = 0;
	if (global.drawscore < global.myscore - 1000)
	    global.drawscore += 500;
	else {
	    if (global.drawscore < global.myscore - 200)
	        global.drawscore += 100;
	    else {
	        if (global.drawscore < global.myscore - 20)
	            global.drawscore += 20;
	        else {
	            if (global.drawscore < global.myscore)
	                global.drawscore += 1;
	        }
	    }
	}
	if (instance_number(objEnemy) + instance_number(objEnemyBash) == 0)
	    update = 1;
	if (!instance_exists(objPlayer))
	    update = 1;
	scorestring = string(global.drawscore) + "pts";
	color2 = merge_color(merge_color(c_aqua, c_fuchsia, 0.5 + lengthdir_x(0.5, dir * 2.32)), c_white, 0.5 + lengthdir_x(0.5, dir * 3));
	color1 = merge_color(c_maroon, merge_color(c_aqua, c_fuchsia, 0.5 - lengthdir_x(0.5, dir * 2.32)), 0.75 + lengthdir_x(0.25, dir * 3));
	dir += 1 + update * 7;
	global.dir++;

	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	showammo = 0;

	// If using a gun, show ammo widget
	if (instance_exists(objPlayer)) {
	    if (objPlayer.sprite_index == sprPWalkM16 || objPlayer.sprite_index == sprPAttackM16) {
	        showammo = 1;
	        maxammo = 24;
	    }
	    if (objPlayer.sprite_index == sprPWalkUzi || objPlayer.sprite_index == sprPAttackUzi) {
	        showammo = 1;
	        maxammo = 30;
	    }
	    if (objPlayer.sprite_index == sprPWalkScorpion || objPlayer.sprite_index == sprPAttackScorpion) {
	        showammo = 1;
	        maxammo = 20;
	    }
	    if (objPlayer.sprite_index == sprPWalkMagnum || objPlayer.sprite_index == sprPAttackMagnum) {
	        showammo = 1;
	        maxammo = 6;
	    }
	    if (objPlayer.sprite_index == sprPWalkSilencedUzi || objPlayer.sprite_index == sprPAttackSilencedUzi) {
	        showammo = 1;
	        maxammo = 30;
	    }
	    if (objPlayer.sprite_index == sprPWalkShotgun || objPlayer.sprite_index == sprPAttackShotgun) {
	        showammo = 1;
	        maxammo = 6;
	    }
	    if (objPlayer.sprite_index == sprPWalkDoubleBarrel || objPlayer.sprite_index == sprPAttackDoubleBarrel1 || objPlayer.sprite_index == sprPAttackDoubleBarrel2) {
	        showammo = 1;
	        maxammo = 2;
	    }
	    if (objPlayer.sprite_index == sprPWalkSilencer || objPlayer.sprite_index == sprPAttackSilencer) {
	        showammo = 1;
	        maxammo = 13;
	    }
	    if (objPlayer.sprite_index == sprPWalkMP5 || objPlayer.sprite_index == sprPAttackMP5) {
	        showammo = 1;
	        maxammo = 32;
	    }
    
	    if (showammo) {
	        // Text to display ammo
	        ammostring = string(objPlayer.ammo) + "/" + string(maxammo) + "rnds";
	        if (ammoy < 16)
	            ammoy += 4;
	        else ammoy = 20;
	    } else {
	        // No gun
	        ammostring = "NO GUN!";
	        if (instance_number(objEnemy) + instance_number(objKnockedOut) > 0) {
	            if (ammoy > -32)
	                ammoy -= 1;
	        }
	    }

	    if (instance_exists(objPlayerBiker) || instance_exists(objPlayerBikerHouse)) {
	        if (objPlayer.ammo > 0) {
	            showammo = 1;
	            // Text to display knives if playing as biker
	            ammostring = string(objPlayer.ammo) + " KNIVES";
	            if (ammoy < 16)
	                ammoy += 4;
	            else ammoy = 20;
	        } else {
	            // No knives
	            ammostring = "NO KNIVES!";
	            if (instance_number(objEnemy) + instance_number(objKnockedOut) > 0) {
	                if (ammoy > -32)
	                    ammoy -= 1;
	            }
	        }
	    }

	    // Finished text
	    if (global.done) {
	        if (showfinished > 0)
	            showfinished -= 1;
	        else showfinished = 240;
	        if (showfinished < 121)
	            scorestring = "YOU GOT " + string(global.drawscore) + "pts";
	        else scorestring = "CHAPTER DONE!";
	        ammostring = "GO TO CAR!";
	        if (instance_exists(objPlayerBiker) || instance_exists(objPlayerBikerHouse))
	            ammostring = "GO TO BIKE";
	        if (ammoy < 20)
	            ammoy += 1;
	        else ammoy = 20;
	    }
	} else {
	    // Dead text
	    if (instance_exists(objPlayerDead)) {
	        scorestring = "YOU'RE DEAD!";
	        if (!global.xbox)
	            ammostring = global.restartkey + " TO RESTART!";
	        else ammostring = "[START] TO RESTART";
	        if (ammoy < 20)
	            ammoy += 1;
	        else ammoy = 20;
	    }
	}
	finish = 0;

	// Tutorial widget during the Metro level
	if (room == rmTrainstationEntrance || room == rmTrainstationDownstairs || room == rmAlley) {
	    if (instance_exists(objPlayer)) {
	        finish = 1;
	        if (global.xbox)
	            finishstring = "[LEFT BUTTON] TO AIM";
	        else finishstring = "[SHIFT] TO AIM";
	        if (instance_exists(objWeapon)) {
	            if (global.xbox)
	                finishstring = "[LEFT TRIGGER] TO TAKE WEAPON";
	            else finishstring = "[RIGHT MOUSE] TO TAKE WEAPON";
	        }
	        if (objPlayer.sprite_index == sprPWalkUnarmed || objPlayer.sprite_index == sprPAttackPunch) {
	            // do nothing
	        } else {
	            if (room == rmTrainstationDownstairs) {
	                if (global.xbox)
	                    finishstring = "[LEFT TRIGGER] TO THROW WEAPON";
	                else finishstring = "[RIGHT MOUSE] TO THROW WEAPON";
	            } else {
	                if (global.xbox)
	                    finishstring = "[LEFT BUTTON] TO AIM";
	                else finishstring = "[SHIFT] TO AIM";
	            }
	        }
	        if (instance_exists(objKnockedOut) || instance_exists(objHoboKnockedOut)) {
	            if (global.xbox)
	                finishstring = "[A] FOR GROUND KILLS";
	            else finishstring = "[SPACE] FOR GROUND KILLS";
	        }
	    }
	    if (!instance_exists(objPlayer) || global.done)
	        finish = 0;
	}

	if (!update)
	    draw_set_font(fntScore);
	else draw_set_font(fntScoreUpdate);
	draw_set_color(c_black);
	draw_rectangle(camera_get_view_width(view_camera[0]) - 18 - string_width(string_hash_to_newline(scorestring)) - 6, 8, camera_get_view_width(view_camera[0]), 32, 0);
	draw_set_font(fntScore);
	draw_rectangle(0, camera_get_view_height(view_camera[0]) - ammoy - 11, 18 + string_width(string_hash_to_newline(ammostring)) + 6, camera_get_view_height(view_camera[0]) - ammoy + 11, 0);

	if (finish)
	    draw_rectangle(camera_get_view_width(view_camera[0]) / 2 - string_width(string_hash_to_newline(finishstring)) * 0.375 - 3, camera_get_view_height(view_camera[0]) - 22, camera_get_view_width(view_camera[0]) / 2 + string_width(string_hash_to_newline(finishstring)) * 0.375 + 3, camera_get_view_height(view_camera[0]) + 3, 0);
	if (!update)
	    draw_set_font(fntScore);
    
	else draw_set_font(fntScoreUpdate);
	draw_set_color(color1);
	draw_text_transformed(camera_get_view_width(view_camera[0]) - 18 - string_width(string_hash_to_newline(scorestring)) * 0.5 + lengthdir_x(1, dir), 20 + lengthdir_y(1, dir), string_hash_to_newline(scorestring), 1, 1, lengthdir_x(2, dir * 1.34));
	draw_set_font(fntScore);

	// Draw finished level widget
	if (finish)
	    draw_text_transformed(camera_get_view_width(view_camera[0]) / 2 + lengthdir_x(0.5, dir), camera_get_view_height(view_camera[0]) - 11 + lengthdir_x(0.5, dir), string_hash_to_newline(finishstring), 0.75, 0.75, lengthdir_x(2, dir * 1.34 + 90));

	// Draw ammo widget
	if (ammoy > -32)
	    draw_text_transformed(18 + string_width(string_hash_to_newline(ammostring)) * 0.5 + lengthdir_x(1, dir), camera_get_view_height(view_camera[0]) - ammoy + lengthdir_y(1, dir), string_hash_to_newline(ammostring), 1, 1, lengthdir_x(2, dir * 1.34));
	draw_set_color(color2);
	if (ammoy > -32)
	    draw_text_transformed(18 + string_width(string_hash_to_newline(ammostring)) * 0.5 + lengthdir_x(1, dir - 180), camera_get_view_height(view_camera[0]) - ammoy + lengthdir_y(1, dir - 180), string_hash_to_newline(ammostring), 1, 1, lengthdir_x(2, dir * 1.34 - 10));
	if (finish)
	    draw_text_transformed(camera_get_view_width(view_camera[0]) / 2 + lengthdir_x(0.5, dir - 180), camera_get_view_height(view_camera[0]) - 11 + lengthdir_x(0.5, dir - 180), string_hash_to_newline(finishstring), 0.75, 0.75, lengthdir_x(2, dir * 1.34 + 100));
	if (!update)
	    draw_set_font(fntScore);

	else {
	    draw_set_color(c_white);
	    draw_set_font(fntScoreUpdate);
	}

	draw_text_transformed(camera_get_view_width(view_camera[0]) - 18 - string_width(string_hash_to_newline(scorestring)) * 0.5 + lengthdir_x(1, dir - 180), 20 + lengthdir_y(1, dir - 180), string_hash_to_newline(scorestring), 1, 1, lengthdir_x(2, dir * 1.34 - 10));



}
