if (global.xbox) {
    if (checkbutton(0, getid(5)) or checkbutton(0, getid(11))) {
        if (!presstart) {
            presstart = 1;
            scrXboxConversationStart();
        } else {
            if (skip < 30)
                skip++;
            else {
                if (sprite == sprPhone)
                    with (objAnsweringMachine)
                        active = 0;
                instance_destroy();
            }
        }
    } else {
        presstart = 0;
        skip = 0;
    }

}

if (reload > 0)
    reload--;
index += indexspeed;

