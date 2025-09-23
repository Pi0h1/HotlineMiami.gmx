test = objPlayer.persistent;
objPlayer.persistent = 0;
global.loaded = 1;
legacy_save(working_directory + "\\tempsave.sav");
global.loaded = 0;
objPlayer.persistent = test;
global.maskload = 0;

