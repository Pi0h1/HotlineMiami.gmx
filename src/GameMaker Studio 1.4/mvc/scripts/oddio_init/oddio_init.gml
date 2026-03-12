var dll;
dll = "Oddio.dll";

global.dll_oddio_init = external_define(dll,"OddioInit",dll_cdecl,ty_real,0);
global.dll_oddio_free = external_define(dll,"OddioFree",dll_cdecl,ty_real,0);

global.dll_oddio_loadmod = external_define(dll,"OddioLoadMod",dll_cdecl,ty_real,1,ty_string);
global.dll_oddio_loopmod = external_define(dll,"OddioLoopMod",dll_cdecl,ty_real,1,ty_string);

global.dll_oddio_loadbin = external_define(dll,"OddioLoadBin",dll_cdecl,ty_real,1,ty_string);
global.dll_oddio_loopbin = external_define(dll,"OddioLoopBin",dll_cdecl,ty_real,1,ty_string);

global.dll_oddio_loadstream = external_define(dll,"OddioLoadStream",dll_cdecl,ty_real,1,ty_string);
global.dll_oddio_loopstream = external_define(dll,"OddioLoopStream",dll_cdecl,ty_real,1,ty_string);

global.dll_oddio_freetrack = external_define(dll,"OddioFreeTrack",dll_cdecl,ty_real,1,ty_real);

global.dll_oddio_play = external_define(dll,"OddioPlay",dll_cdecl,ty_real,1,ty_real);
global.dll_oddio_pause = external_define(dll,"OddioPause",dll_cdecl,ty_real,1,ty_real);
global.dll_oddio_stop = external_define(dll,"OddioStop",dll_cdecl,ty_real,1,ty_real);

global.dll_oddio_setposition = external_define(dll,"OddioSetPosition",dll_cdecl,ty_real,2,ty_real,ty_real);
global.dll_oddio_setvolume = external_define(dll,"OddioSetVolume",dll_cdecl,ty_real,2,ty_real,ty_real);
global.dll_oddio_setpanning = external_define(dll,"OddioSetPanning",dll_cdecl,ty_real,2,ty_real,ty_real);

global.dll_oddio_isplaying = external_define(dll,"OddioIsPlaying",dll_cdecl,ty_real,1,ty_real);
global.dll_oddio_ispaused = external_define(dll,"OddioIsPaused",dll_cdecl,ty_real,1,ty_real);

global.dll_oddio_getlength = external_define(dll,"OddioGetLength",dll_cdecl,ty_real,1,ty_real);
global.dll_oddio_getposition = external_define(dll,"OddioGetPosition",dll_cdecl,ty_real,1,ty_real);

global.dll_oddio_getvolume = external_define(dll,"OddioGetVolume",dll_cdecl,ty_real,1,ty_real);
global.dll_oddio_getpanning = external_define(dll,"OddioGetPanning",dll_cdecl,ty_real,1,ty_real);

return external_call(global.dll_oddio_init);
