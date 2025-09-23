current = 0;

dir = random(360);
factor = 0;
fade = 0;
c_amount = 0;

repeat(5)
    instance_create(random(room_width), 0, objHouseReturn);

i = 0;
repeat(5) {
    palmx[i] = (room_width / 4) * i;
    palmindex[i] = floor(random(6));
    i++;
}

sxeasy_stop(0);
sxeasy_setVolume(1);
sxeasy_play(working_directory + "\\TurfIntro.mp3");

alpha = random(1);

state = 0;
blackx = 129;

wait = 60;

global.levels[scrGetCurrentLevel()] = 1;
global.grade[12] = 15;
scrSaveUnlocked();

