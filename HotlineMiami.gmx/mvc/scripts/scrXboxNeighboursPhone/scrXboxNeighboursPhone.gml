if (gettrigger_r() > 100 || gettrigger_l() > 100) {
    if (!instance_exists(objPlayerMouseHouse) || answered)
        exit;
    if (place_meeting(x + lengthdir_x(12, objPlayer.dir - 180), y + lengthdir_y(12, objPlayer.dir - 180), objPlayer) && called) {
        with (objPlayer) {
            if (sprite_index == sprPWalkUnarmed || sprite_index == sprPAttackPunch || sprite_index == sprPAttackBash)
                noweapon = 1;
            else noweapon = 0;
            if (!noweapon) {
                my_id = instance_create(x, y, objWeaponThrow);
                my_id.direction = random(360);
                my_id.speed = 2 + random(1);
                my_id.image_index = scrCurrentWeaponExt(sprite_index);
                my_id.ammo = ammo;
            }
        }
        objPlayer.sprite_index = sprPTakePhone;
        objPlayer.image_index = 0;
        objPlayer.active = 0;
        image_index = 1;
        scrGetMessage(0);
        answered = 1;
        audio_stop_sound(sndPhoneCall);
        audio_play_sound(sndPhone, 0, false);
        global.done = 1;
    }
}
