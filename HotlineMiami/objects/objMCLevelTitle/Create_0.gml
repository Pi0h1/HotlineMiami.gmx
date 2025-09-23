x = room_width / 2;
scrFreeSurfaces()
if global.resetstory = 1 {
    scrResetStory()
} else {
    set_automatic_draw(true)
}
global.levels[scrGetCurrentLevel() - 1] = 1
scrSaveUnlocked()
alarm[0] = 300
pointx = -192
i = 0;
repeat(string_length(global.title)) {
    amount[i] = 1;
    on[i] = 0;
    i++;
}
dir = 90;

fade = 0;
c_amount = 0;
repeat(5)
    instance_create(random(room_width), 0, objHouse);

i = 0;
repeat(5) {
    palmx[i] = (room_width / 4) * i;
    palmindex[i] = floor(random(6));
    i++;
}


hint[0] = "TIP: YOU HAVE THREE THROWING KNIVES";
hint[1] = "TIP: USE YOUR SPEED TO YOUR ADVANTAGE";
hint[2] = "TIP: DON'T BE AFRAID OF DYING";
hint[3] = "TIP: RECKLESSNESS IS REWARDED";
hint[4] = "TIP: ENEMIES ARE PREDICTABLE";
hint[5] = "TIP: USE DOORS STRATEGICALLY";
hint[6] = "TIP: HIGH SCORES STILL UNLOCK MASKS";
hint[7] = "TIP: FOLLOW THE RED ARROWS";
hint[8] = "TIP: PAY ATTENTION TO DETAILS";
hint[9] = "TIP: YOUR MEAT CLEAVER IS THERE TO STAY";
hint[10] = "TIP: FINISH OFF FALLEN ENEMIES";

myhint = floor(random(11));

