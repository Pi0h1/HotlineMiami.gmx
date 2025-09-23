dir = random(10000);
factor = 0;
mask = floor(random(6));
amount = 180;
maskamount = 180;
on = 0;
fade = 0;
currentmask = 0;
scrInitXboxButtons();
name[0] = "Richard";
name[1] = "Rasmus";
name[2] = "Tony";
name[3] = "Aubrey";
name[4] = "Don Juan";
name[5] = "Graham";
name[6] = "Dennis";
name[7] = "George";
name[8] = "Ted";
name[9] = "Rufus";
name[10] = "Rami";
name[11] = "Willem";
name[12] = "Peter";
name[13] = "Zack";
name[14] = "Oscar";
name[15] = "Rick";
name[16] = "Brandon";
name[17] = "Charlie";
name[18] = "Louie";
name[19] = "Phil";
name[20] = "Nigel";
name[21] = "Earl";
name[22] = "Jones";
name[23] = "Carl";
name[24] = "Jake";
name[25] = "Richter";
global.currentmask = 0;

switch (global.sequence) {
    case   rmSequence1: global.currentmask =  1; break;
    case   rmSequence2: global.currentmask =  2; break;
    case   rmSequence3: global.currentmask =  3; break;
    case   rmSequence4: global.currentmask =  4; break;
    case   rmSequence5: global.currentmask =  5; break;
    case   rmSequence6: global.currentmask =  6; break;
    case   rmSequence7: global.currentmask =  7; break;
    case   rmSequence8: global.currentmask =  8; break;
    case   rmSequence9: global.currentmask =  9; break;
    case  rmSequence10: global.currentmask = 10; break;
    case  rmSequence11: global.currentmask = 11; break;
    case  rmSequence12: global.currentmask = 12; break;
    case  rmSequence13: global.currentmask = 13; break;
    case  rmSequence14: global.currentmask = 14; break;
    case       rmMCBar: global.currentmask = 15; break;
    case rmMCSequence2: global.currentmask = 16; break;
    case rmMCSequence3: global.currentmask = 17; break;
}

if (global.lastgrade < 7 || global.masks[global.currentmask] == 1) {
    global.currentmask = global.newmask[0];
    currentmask = 1;
}
surface_set_target(global.surf1);
draw_clear_alpha(c_black, 0);
surface_reset_target();
alarm[0] = 100;
shine = 0;

