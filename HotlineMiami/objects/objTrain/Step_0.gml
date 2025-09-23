if (!place_meeting(x, y, objEnemy))
    solid = 1;

if (global.done)
    exit;
if (visible) {
    global.test = 0;
    with (objSubwayDoor) {
        if (on == 2)
            global.test = 1;
    }
    if (global.test == 1) {
        if (instance_exists(objEnemy) || instance_exists(objKnockedOut) || instance_exists(objBoss) || instance_exists(objESubwayStatic)) {
            // do nothing
        } else {
            global.done = 1;
            instance_create(x, y, objCheckpoint);
        }
    }
}

