/*-Combos = Combo Bonus
-Total time = Time Bonus
-Weapons used = Flexibility Bonus
-Distance between kills = Mobility Bonus
-Only melee bonus = Melee Bonus
-Shots fired during combat = Artillery Bonus
-People who see you kill someone = Boldness Bonus*/






if (global.barehanded && scrGetCurrentLevel() == 5)
    SteamSetAchievement("ACH_THESE_ARE_MY_GUNS");
scrSaveAchievements();
scrCheckGuns();
if (global.xbox)
    scrInitXboxButtons();
scrCountFlexibilityScore();
scrCountMobilityScore();
scrCheckLetters();
scrCheckUsedGuns();
scrCheckUsedMasks();
scrCheckUsedThrows();
scrCheckUsedKills();
SteamCheckFinal();
song = working_directory + "\\Daisuke.mp3";
global.myscore = 0;
bonus[0] = global.killscore;
bonus[1] = global.boldscore;
bonus[2] = global.comboscore;
bonus[3] = floor((18000 - global.time) * 0.5);
if (bonus[3] < 0)
    bonus[3] = 0;
bonus[4] = global.flexibilityscore;
bonus[5] = global.mobilityscore;
bonus[6] = global.specialscore;
i = 0;
fastforward = 0;
repeat(7) {
    drawbonus[i] = 0;
    amount[i] = 0;
    global.myscore += bonus[i];
    i++;
}
global.levelscore[global.currentlevel] = global.myscore;
parscore = "/" + string(round((scrGetMaxpoints() * (7 / 15)) * (1 / 500)) * 500) + "pts";
type[0] = "KILLINGS:";
type[1] = "BOLDNESS:";
type[2] = "COMBOS:";
type[3] = "TIME BONUS:";
type[4] = "FLEXIBILITY:";
type[5] = "MOBILITY:";
type[6] = "SPECIAL:";
global.totalscore += global.myscore;
global.newguns = 0;
allguns = 0;
i = 0;
while (global.newgun[i] == 1 && i < 15) {
    i++;
}
if (global.totalscore > (i + 1) * 50000 && global.totalscore - global.myscore < (i + 1) * 50000)
    global.newguns = 1;
i++;
if (global.totalscore > (i + 1) * 50000 && global.totalscore - global.myscore < (i + 1) * 50000)
    global.newguns = 2;
else i--;
nextgun = (i + 1) * 50000;
leftgun = global.totalscore;
i = 0;
while (global.newgun[i] == 1 && i < 16) {
    i++;
}
if (i == 15 && global.newguns == 2)
    global.newguns = 1;
if (i == 16) {
    allguns = 1;
    global.newguns = 0;
}
current = 0;
dir = random(360);
factor = 0;
fade = 0;
c_amount = 0;

global.surf1 = surface_create(room_width, room_height);
surface_set_target(global.surf1);
draw_clear_alpha(c_black, 0);
surface_reset_target();

repeat(5)
    instance_create(random(room_width), 0, objHouseReturn);

i = 0;
repeat(5) {
    palmx[i] = (room_width / 4) * i;
    palmindex[i] = floor(random(6));
    i++;
}

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
/*-Combos = Combo Bonus
-Total time = Time Bonus
-Weapons used = Flexibility Bonus
-Distance between kills = Mobility Bonus
-Only melee bonus = Melee Bonus
-Shots fired during combat = Artillery Bonus
-People who see you kill someone = Boldness Bonus*/

/* */
/*  */
