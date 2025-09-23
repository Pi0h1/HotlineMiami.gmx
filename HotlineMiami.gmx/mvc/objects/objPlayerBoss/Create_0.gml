image_speed = 0;
alert = 0;
state = 0;
scrInitMaskPos();
scrUpdateMaskPos(sprite_index);
lastsprite = sprite_index;
maskindex = 0;
global.maskindex = 0;
maskon = 1;
global.maskon = 1;
legindex = 0;

sxeasy_stop(0);
sxeasy_play(working_directory + "\\Release.mp3");
test = objPlayer.persistent;
objPlayer.persistent = 0;
global.loaded = 1;
game_save(working_directory + "\\tempsave.sav");
global.loaded = 0;
objPlayer.persistent = test;

