if (global.xbox)
    exit;
    
if (state == 0) {
    if (select == 0) {
        if (!fade) {
            global.paused = 1;
            if (blacky >= 1)
                on = 0;
        }
    }
    if (select == 1) {
        on = 2;
        state = 1;
    }
    if (select == 2) {
        legacy_load("restart.dat");
    }
    if (select == 3) {
        if (on)
            fade = 1;
    }
}

