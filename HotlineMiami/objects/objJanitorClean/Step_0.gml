if (!smirked) {
    if (point_distance(x, y, objPlayer.x, objPlayer.y) < 80) {
        scrGetMessage(0);
        smirked = 1;
    }
}

if (smirked) {
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
}

