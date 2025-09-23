if (!instance_exists(objPlayer))
    exit;
if (reload > 0)
    reload--;
else {
    if (point_distance(x, y, objPlayer.x, objPlayer.y) < 220) {
        if (!scrCollisionLineExt(x, y, objPlayer.x, objPlayer.y, 3, objSolid, objDoorV, objWallSoftH)) {
            my_id = instance_create(x, y, objEnemy);
            my_id.sprite_index = sprEWalkM16;
            my_id.alert = 1;
            my_id.checkreload = 15;
            if (global.enemy == id)
                global.enemy = my_id;
            instance_destroy();
        }
    }
    reload = 15;
}

if (on) {
    my_id = instance_create(x, y, objEnemy);
    my_id.sprite_index = sprEWalkM16;
    my_id.alert = 1;
    my_id.checkreload = 15;
    if (global.enemy == id)
        global.enemy = my_id;
    instance_destroy();
}

