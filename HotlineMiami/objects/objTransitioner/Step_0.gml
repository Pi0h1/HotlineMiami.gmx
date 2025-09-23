if (!instance_exists(objPlayer))
    exit;
if (room == rmTrainstationEntrance) {
    if (objTrain.visible) {
        if (!place_meeting(x, y, objPlayer))
            solid = 1;
        visible = 0;
        exit;
    }
}
if (instance_exists(objEnemy) || instance_exists(objKnockedOut) || instance_exists(objBoss) || instance_exists(objEHideM16) || instance_exists(objESubwayStatic)) {
    if (!place_meeting(x, y, objPlayer))
        solid = 1;
    visible = 0;
} else {
    solid = 0;
    if (objPlayer.persistent) {
        if (!place_meeting(x, y, objPlayer)) {
            visible = 1;
            solid = 1;
        }
    } else visible = 1;
}

