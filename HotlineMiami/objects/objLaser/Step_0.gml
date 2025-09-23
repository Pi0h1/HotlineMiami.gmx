if (on) {
    if (!stop)
        x += lengthdir_x(3, ldir);
    ldir += 2;
    y = start_y;
    with (objWindowH)
        solid = 0;
    while (place_free(x, y - 1))
        y -= 4;
    with (objWindowH)
        solid = 1;

    if (instance_exists(objPlayer)) {
        if (objPlayer.y > y) {
            if (objPlayer.x > x - 4 && objPlayer.x < x + 4) {
                stop = 1;
                with (objPlayer) {
                    energie = 0;
                    my_id = instance_create(x, y, objEBullet);
                    my_id.visible = 0;
                    my_id.vspeed = -1;
                }
                if (x < 352) {
                    with (objWindowH) {
                        if (x == 288) {
                            instance_create(x, y, objBrokenWindowH);
                            instance_destroy();
                        }
                    }
                }
                if (x >= 352 && x <= 384) {
                    with (objWindowH) {
                        if (x == 352) {
                            instance_create(x, y, objBrokenWindowH);
                            instance_destroy();
                        }
                    }
                }
                if (x > 384) {
                    with (objWindowH) {
                        if (x == 416) {
                            instance_create(x, y, objBrokenWindowH);
                            instance_destroy();
                        }
                    }
                }
                audio_play_sound(choose(sndGlass1, sndGlass2), 0, false);
                audio_play_sound(sndHitWall, 0, false);
            }
        }
    }
}

