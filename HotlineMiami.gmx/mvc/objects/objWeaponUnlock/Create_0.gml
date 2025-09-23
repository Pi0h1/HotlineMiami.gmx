if (global.xbox)
    scrInitXboxButtons();
surface_free(global.surf1);
global.surf1 = surface_create(room_width, room_height);
surface_set_target(global.surf1);
draw_clear_alpha(c_black, 0);
surface_reset_target();

start_x = room_width + 40;

current = 7;
while (global.newgun[current - 7] == 1 && current - 7 < 15) {
    current++;
}
dir = 0;
factor = 0;
on = 0;

last = 0;
shine = 0;

fade = 0;
c_amount = 0;

gun[0] = "GOLF CLUB";
gun[1] = "LEAD PIPE";
gun[2] = "BASEBALL BAT";
gun[3] = "KNIFE";
gun[4] = "M16 ASSAULT RIFLE";
gun[5] = "PUMP ACTION SHOTGUN";
gun[6] = "DOUBLE-BARREL SHOTGUN";
gun[7] = "SAMURAI SWORD";
gun[8] = "GLASS BOTTLE";
gun[9] = "MAGNUM";
gun[10] = "MACHETE";
gun[11] = "BEER CAN";
gun[12] = "SCORPION";
gun[13] = "HAMMER";
gun[14] = "BRICK";
gun[15] = "UZI MACHINE GUN";
gun[16] = "SLEDGE HAMMER";
gun[17] = "NINJA STAR";
gun[18] = "DART";
gun[19] = "MP5 SUBMACHINE GUN";
gun[20] = "FIRE AXE";
gun[21] = "SCISSORS";
gun[22] = "SILENCED PISTOL";

