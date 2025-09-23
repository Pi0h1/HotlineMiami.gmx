if (!instance_exists(objPlayer))
    exit
if (reload > 0)
    reload--;
else {
    if (point_distance(x, y, objPlayer.x, objPlayer.y) < 220) {
        if (!scrCollisionLineExt(x, y, objPlayer.x, objPlayer.y, 3, objSolid, objDoorV, objWallSoftH)) {
            if (room == rmTrainstationEntrance || room == rmBossClubFloor3)
                my_id = instance_create(x, y, objEnemyMeleeStationary);
            else my_id = instance_create(x, y, choose(objEnemy, objEnemyMeleeStationary));
            my_id.alert = 1;
            my_id.checkreload = 15;
            if (global.enemy == id)
                global.enemy = my_id;
            instance_destroy();
        }
    }
    reload = 20;
}

