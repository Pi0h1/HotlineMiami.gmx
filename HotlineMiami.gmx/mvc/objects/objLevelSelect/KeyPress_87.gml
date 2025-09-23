if (global.xbox)
    exit;
if (fade || wait > 0)
    exit;
wait = 3;
if (repeats < sprite_get_number(sprite_index))
    repeats += 8;

