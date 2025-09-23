if (global.xbox) {
    if (checkbutton(0, getid(5)) or checkbutton(0, getid(11))) {
        if (!presstart) {
            presstart = 1;
            scrXboxEndingDialogue2Start();
        }
    } else presstart = 0;
}

if (stop) {
    if (blackx > 15) {
        blackx -= 2.5;
    } else {
        objEffector.blackx = blackx;
        with (objPlayerBiker) {
            my_id = instance_create(x, y, objPlayerBiker);
            my_id.sprite_index = sprBoss2Walk;
            instance_destroy();
        }
        global.done = 1;
        instance_create(x, y, objLevelComplete);
        instance_destroy();
    }
}

