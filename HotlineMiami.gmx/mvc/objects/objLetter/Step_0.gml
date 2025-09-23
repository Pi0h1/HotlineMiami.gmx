if (check) {
    check = 0;
    if (!follow) {
        global.my_id = id;
        with (objLetterSocket) {
            global.check = 0;
            global.myx = x;
            global.myy = y;
            with (objLetter) {
                if (x == global.myx && y == global.myy)
                    global.check = 1;
            }
            if (!global.check) {
                if (place_meeting(x, y, global.my_id)) {
                    global.my_id.x = x;
                    global.my_id.y = y;
                }
            }
        }
    }
}

if (follow) {
    if (global.xbox) {
        x = objPuzzle.mousex;
        y = objPuzzle.mousey;
    } else {
        x = mouse_x;
        y = mouse_y;
    }
}

