if (fade || wait > 0)
    exit;
    
wait = 3;
repeats = 0;
if (level == 0) {
    if (select > 0)
        select--;
    else select = 3;
}
if (level == 1) {
    if (select > 0)
        select--;
    else select = 4;
}
if (level == 2) {
    if (select > 0)
        select--;
    else select = 1;
}
if (level == 4) {
    if (select > 0)
        select--;
    else select = 3;
    if (select == 1 && global.surfaces)
        select = 0;
}

