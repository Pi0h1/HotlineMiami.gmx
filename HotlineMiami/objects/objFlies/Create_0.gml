i = 0;
repeat(99) {
    my_x[i] = random(400);
    my_y[i] = random(256);
    mydir[i] = random(360);
    diradd[i] = -4 + random(8);
    size[i] = 1 + random(3);
    myspeed[i] = size[i];
    i++;
}

addToSave();