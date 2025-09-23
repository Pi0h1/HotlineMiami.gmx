surface_free(global.surf1);
global.surf1 = surface_create(527, 287);
surface_set_target(global.surf1);
draw_clear(c_white);
surface_reset_target();
talk = 0;
reload = 0;

i = 0;
repeat(100) {
    size[i] = 1 + random(2);
    myx[i] = random(room_width);
    myy[i] = random(room_height);
    mydir[i] = random(360);
    myspeed[i] = 1 + random(2);
    diradd[i] = -4 + random(8);
    i++;
}
skip = 0;
on = 1;

