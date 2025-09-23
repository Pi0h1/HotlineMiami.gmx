if (!smirked) {
    if (point_distance(x, y, objPlayer.x, objPlayer.y) < 40) {
        scrGetMessage(1);
        smirked = 1;
    }
}

if (smirked) {
    if !instance_exists(objPhoneConversation) {
        if (wait > 0)
            wait--;
        else {
            scrGetMessage(2);
            smirked = 2;
        }
    }
}

