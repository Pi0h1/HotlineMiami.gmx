with objEnemy {
    if scrCantGetHit(object_index) valid = 0
    else valid = 1
    if (place_meeting(x, y, objPlayer) or place_meeting(x + global.spacex, y + global.spacey, objPlayer)) and valid = 1 {
        mask_index = sprWeaponMask
        if scrCollisionLineExt(x, y, objPlayer.lastx, objPlayer.lasty, 4, objSolid, objDoorV, objWallSoft) {
            scrMoveSolidOff() mask_index = sprMask objPlayer.x = objPlayer.lastx objPlayer.y = objPlayer.lasty exit
        }
        mask_index = sprMask
        edir = point_direction(objPlayer.lastx, objPlayer.lasty, x, y)
        PlaySFX(sndDoorHit)
        global.shake = 3
        my_id = instance_create(x, y, objKnockedOut)
        my_id.type = object_index
        if scrIsPolice(object_index) my_id.sprite_index = sprPoliceGetUp
        my_id.direction = edir - 10 + random(20)
        my_id.angle = my_id.direction
        with my_id move_outside_solid(angle - 180, 16)
        my_id.speed = 3
        scrIdleGetEnemy()
        if sprite_index = sprEWalkUnarmed or sprite_index = sprPoliceWalkUnarmed noweapon = 1
        else noweapon = 0
        if noweapon = 0 {
            global.test = 0
            with objEnemy
            if alert = 1 global.test += 1
            my_id = instance_create(x, y - 12, objScore)
            my_id.text = "+" + string(200 + 400 * global.factor) + "pts"
            global.myscore += 200 + 400 * global.factor
            global.boldscore += 200 + 400 * global.factor
            global.combotime += 100
            global.killx[global.kills] = x
            global.killy[global.kills] = y
            global.kills += 1
            my_id = instance_create(x, y, objWeaponThrow)
            my_id.direction = direction - 70 + random(40)
            my_id.image_index = scrCurrentWeaponExt(sprite_index)
            my_id.speed = (2 + random(2)) * delta
            my_id.ammo = ammo
        }
        instance_destroy();
    }
}
