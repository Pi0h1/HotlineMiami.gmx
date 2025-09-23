if (!instance_exists(objPlayer))
    exit;
if (instance_exists(objPhone)) {
    if (!global.done) {
        if (!place_meeting(x, y, objPlayer))
            solid = 1;
        visible = 0;
        exit;
    }
}
if (instance_exists(objEnemy) || instance_exists(objKnockedOut) || instance_exists(objBoss) || instance_exists(objEHideM16)) {
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

if (instance_exists(objSwat) && room == rmSwatUpstairs) {
    solid = 0;
    if (objPlayer.persistent) {
        if (!place_meeting(x, y, objPlayer)) {
            visible = 1;
            solid = 1;
        }
    } else visible = 1;
}

