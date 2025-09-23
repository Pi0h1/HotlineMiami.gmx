if (global.xbox) {
    if (checkbutton(0, getid(6))) {
        if (!pressback) {
            pressback = 1;
            scrXboxEffectorPause();
        }
    } else pressback = 0;
}

