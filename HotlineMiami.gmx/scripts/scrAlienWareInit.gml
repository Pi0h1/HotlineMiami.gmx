//globalvar iAlienInitalize, iAlienRelease, iAlienRotatePink, iAlienRotateYellow, iAlienDeathBlink;

global.iAlienInitalize = external_define(working_directory+"\AlienInMiami.dll", "AlienInitialize",dll_cdecl, ty_real, 0);

global.iAlienRelease = external_define(working_directory+"\AlienInMiami.dll", "AlienRelease",dll_cdecl, ty_real, 0);

global.iAlienRotatePink = external_define(working_directory+"\AlienInMiami.dll", "AlienRotatePink",dll_cdecl, ty_real, 0);

global.iAlienRotateYellow = external_define(working_directory+"\AlienInMiami.dll", "AlienRotateYellow",dll_cdecl, ty_real, 0);

global.iAlienDeathBlink = external_define(working_directory+"\AlienInMiami.dll", "DeathBlink",dll_cdecl, ty_real, 0);

external_call(global.iAlienInitalize);
