if (global.xbox)
    scrInitXboxButtons();
global.levels[15] = 1;
global.grade[15] = 15;
scrSaveUnlocked();
topic[0] = "Game Designed By";
credit[0] = "Jonatan Soderstrom#& Dennis Wedin";
topic[1] = "Lead Artist";
credit[1] = "Dennis Wedin";
topic[2] = "Additional Graphics";
credit[2] = "Jonatan Soderstrom";
topic[3] = "Programmer";
credit[3] = "Jonatan Soderstrom";
topic[4] = "Additional Programming";
credit[4] = "Oscar Dragen";
topic[5] = "Sound Effects";
credit[5] = "Jordan Fehr";
topic[6] = "MAC Version";
credit[6] = "Leon Arnott";

topic[7] = "Music by";
credit[7] = "Sun Araw";
topic[8] = "Music by";
credit[8] = "Coconuts";
topic[9] = "Music by";
credit[9] = "M.O.O.N.";
topic[10] = "Music by";
credit[10] = "Jasper Byrne";
topic[11] = "Music by";
credit[11] = "El Huervo";
topic[12] = "Music by";
credit[12] = "Perturbator";
topic[13] = "Music by";
credit[13] = "Scattle";
topic[14] = "Music by";
credit[14] = "Elliott Berlin";
topic[15] = "Music by";
credit[15] = "Eirik Suhrke";

current = 0;
fade = 0;
topicfade = 0;
topicalpha = 0;
creditalpha = 0;
credits_y = 0;
credit_y = 58;
dir = 0;

alarm[0] = 320;
rollcredits = 0;
creditlist = "Published by#Devolver Digital##Graeme Struthers#Nigel Lowrie#Rick Stults#Mike Wilson#Harry Miller#Stephanie Tinsley-Schopp#Kirk Johnson#Will Elliott#####Special Thanks to:##Tim W#Ville Krumlinde#Jeff Roberts#Jan Willem Nijman#Rami Ismail#Edmund McMillen#Tommy Refenes#Nigel Lowrie#Fork Parker#Niklas Akerblad#Mats Ek#Kert Gartner#Peter Rasmusson#Martin Svensson#Markus Larsson#Linda Parlesten#Nicolas Winding Refn#Ikiki#Friends and family#Derek Yu & Andy Hull######Game Testers##Jan Willem Nijman#Rami Ismail#Edmund McMillen#Tommy Refenes#Jasper Byrne#Leon Arnott#Nigel Lowrie#Michael Todd#Connor#Franklin#Jukio Kallio#Piet Piet#Xion#thernz#Benjamin Pettengil#Andy#Lazrool#Sheldon Ketterer#herror#Zaratustra#Anna Anthropy#Charlie#Rich Edwards#Ian Snyder#Robert Yang#Zaphos#Terry Cavanagh#Jake Elliott#Troshinsky#Daniel Benmergui#Stephen Lavelle#psysal#Bennett Foddy#Jonathan Whiting#randomnine########THE END";
surface_free(global.surf1);
surface_free(global.surf2);
surface_free(global.surf3);

global.surf1 = surface_create(room_width, room_height);
global.surf2 = surface_create(room_width * 3, room_height * 3);
global.surf3 = surface_create(room_width * 3, room_height * 3);
surface_set_target(global.surf1);
draw_clear_alpha(c_black, 0);
surface_reset_target();
surface_set_target(global.surf2);
draw_clear_alpha(c_black, 0);
surface_reset_target();
surface_set_target(global.surf3);
draw_clear_alpha(c_black, 0);
surface_reset_target();

repeat(24) {
    instance_create(random(room_width), random(room_height), objSpread);
}
SteamSetAchievement("ACH_THE_END");
endfade = 0;
c_amount = 0;

