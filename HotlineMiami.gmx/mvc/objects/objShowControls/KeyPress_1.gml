if (wait > 0)
    exit;
wait = 3;
if (edit || select == 0) {
    if (select == 0) {
        if (current == 0)
            global.upkey = string_upper(chr(keyboard_lastkey));
        if (current == 1)
            global.leftkey = string_upper(chr(keyboard_lastkey));
        if (current == 2)
            global.downkey = string_upper(chr(keyboard_lastkey));
        if (current == 3)
            global.rightkey = string_upper(chr(keyboard_lastkey));
        current++;
        if (current == 4) {
            edit = 0;
            scrSaveKeys();
            current = 0;
        }
    }
}

if (edit && select == 14) {
    global.restartkey = string_upper(chr(keyboard_lastkey));
    edit = 0;
    scrSaveKeys();
    current = 0;
}

