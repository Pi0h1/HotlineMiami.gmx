if (!instance_exists(objPlayer))
    exit;
if (!smirked) {
    if (point_distance(x, y, objPlayer.x, objPlayer.y) < 80) {
        if (point_direction(x, y, objPlayer.x, objPlayer.y) < 15) {
            if (state == 0) {
                objPWalkWindow.active = 0;
                with (objEffector) {
                    my_id = instance_create(x, y, objEffectorHouse);
                    my_id.amount = 180;
                    instance_destroy();
                }
                scrGetMessage(1);
                state = 1;
                wait = 15;
            }

            if (state == 1) {
                if (!instance_exists(objPhoneConversation)) {
                    if (wait > 0)
                        wait--;
                    else {
                        state = 2;
                        with (objPWalkWindow)
                            active = 1;
                        viewx = __view_get( e__VW.XView, 0 );
                        viewy = __view_get( e__VW.YView, 0 );
                        with (objEffector)
                            instance_destroy();
                        my_id = instance_create(x, y, objEffector);
                        my_id.blackx = 15;
                        my_id.amount = 180;
                        __view_set( e__VW.XView, 0, viewx );
                        __view_set( e__VW.YView, 0, viewy );
                        smirked = 1;
                    }
                }
            }
        }
    }
}

if (instance_exists(objPhoneConversation)) {
    if (vol > 0.35)
        vol -= 0.01;
    sxeasy_setVolume(vol);
} else {
    if (vol < 1) {
        vol += 0.05;
        sxeasy_setVolume(vol);
    }
}

