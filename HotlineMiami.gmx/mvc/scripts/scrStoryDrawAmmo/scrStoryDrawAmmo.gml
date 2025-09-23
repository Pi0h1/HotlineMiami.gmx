// Hud used alongside objPlayerMouseHouse (especially during boss fights)
d3d_set_projection_ortho(0, 0, __view_get( e__VW.WView, 0 ), __view_get( e__VW.HView, 0 ), 0);
showammo = 0;
if (instance_exists(objPlayer) && !instance_exists(objPhoneConversation)) {
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
    if (objPlayer.sprite_index == sprPWalkMagnum || objPlayer.sprite_index = sprPAttackMagnum) {
        showammo = 1;
        maxammo = 6;
    }
    if (objPlayer.sprite_index == sprPWalkSilencedUzi || objPlayer.sprite_index = sprPAttackSilencedUzi) {
        showammo = 1;
        maxammo = 30;
    }
    if (objPlayer.sprite_index == sprPWalkShotgun || objPlayer.sprite_index = sprPAttackShotgun) {
        showammo = 1;
        maxammo = 6;
    }
    if (objPlayer.sprite_index == sprPWalkDoubleBarrel || objPlayer.sprite_index = sprPAttackDoubleBarrel1 || objPlayer.sprite_index = sprPAttackDoubleBarrel2) {
        showammo = 1;
        maxammo = 2;
    }
    if (objPlayer.sprite_index == sprPWalkSilencer || objPlayer.sprite_index = sprPAttackSilencer) {
        showammo = 1;
        maxammo = 13;
    }
    if (objPlayer.sprite_index == sprPWalkMP5 || objPlayer.sprite_index = sprPAttackMP5) {
        showammo = 1;
        maxammo = 32;
    }
    if (objPlayer.sprite_index == sprPWalkMP5 || objPlayer.sprite_index = sprPAttackMP5) {
        showammo = 1;
        maxammo = 32;
    }
    if (showammo)
        ammostring = string(objPlayer.ammo) + "/" + string(maxammo) + "rnds";
    else ammostring = "NO GUN!";
    if (instance_exists(objPlayerBiker) || instance_exists(objPlayerBikerHouse)) {
        if (room == rmHideout || room == rmJanitors) {
            // do nothing
        } else {
            if (objPlayer.ammo > 0 && (instance_exists(objEnemy) || instance_exists(objECrawl) || instance_exists(objBoss) || instance_exists(objKnockedOut))) {
                showammo = 1;
                ammostring = string(objPlayer.ammo) + " KNIVES";
            } else {
                ammostring = "NO KNIVES!";
                showammo = 0;
            }
        }
    }
}
scorestring = global.drawscore;
if (instance_exists(objPlayerDead)) {
    if (room == rmSequence12b || room == rmSequence12c) {
        // do nothing
    } else {
        ammostring = global.restartkey + " TO RESTART!";
        scorestring = "YOU'RE DEAD!";
        showammo = 1;;
    }
}
if (showammo) {
    draw_set_valign(fa_top);
    draw_set_font(fntScore);
    draw_set_color(merge_color(c_black, c_maroon, 0.25 + lengthdir_x(0.25, dir * 4)));
    draw_set_halign(fa_left);
    draw_text_transformed(8 + 1, __view_get( e__VW.HView, 0 ) - 44 + 1, string_hash_to_newline(ammostring), 1, 1, 0);
    draw_set_halign(fa_right);
    draw_text_transformed(__view_get( e__VW.HView, 0 ) - 8 + 1, __view_get( e__VW.HView, 0 ) + 32 + 1, string_hash_to_newline(ammostring), 1, 1, 0);
    draw_set_color(merge_color(c_white, c_red, 0.25 + lengthdir_x(0.25, dir * 4)));
    dir += 8;
    draw_set_halign(fa_left);
    draw_text_transformed(8, __view_get( e__VW.HView, 0 ) - 44, string_hash_to_newline(ammostring), 1, 1, 0);
    draw_set_halign(fa_right);
    draw_text_transformed(__view_get( e__VW.HView, 0 ) - 8, __view_get( e__VW.HView, 0 ) + 32, string_hash_to_newline(ammostring), 1, 1, 0);
}
