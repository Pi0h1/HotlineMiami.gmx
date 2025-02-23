globalvar iSteamInit, 
    iSteamShutdown, 
    iSteamRunCallbacks,
    iSteamSetAchievement,
    iSteamStoreStats,
    iSteamSetStatInt,
    iSteamSetStat,
    
    iSteamFindLeaderboard, 
    iSteamUploadLeaderboardScore,
    iSteamDownloadScores,
    
    iSteamGetRankScore,
    iSteamGetRankName,
    iSteamGetGlobalRankForPosition,
    
    iSteamResetAllStats,
    iSteamIncStat,
    iSteamCheckFinal;

iSteamInit              = external_define(working_directory+"\Steamworks.dll", "SteamInit",            dll_cdecl, ty_real, 0);
iSteamShutdown          = external_define(working_directory+"\Steamworks.dll", "SteamShutdown",        dll_cdecl, ty_real, 0);
iSteamRunCallbacks      = external_define(working_directory+"\Steamworks.dll", "SteamRunCallbacks",    dll_cdecl, ty_real, 0);

iSteamStoreStats        = external_define(working_directory+"\Steamworks.dll", "SteamStoreStats",      dll_cdecl, ty_real, 0);

iSteamSetAchievement    = external_define(working_directory+"\Steamworks.dll", "SteamSetAchievement",  dll_cdecl, ty_real, 1, ty_string);

iSteamSetStatInt        = external_define(working_directory+"\Steamworks.dll", "SteamSetStatInt",      dll_cdecl, ty_real, 2, ty_string, ty_real);
iSteamSetStat           = external_define(working_directory+"\Steamworks.dll", "SteamSetStat",         dll_cdecl, ty_real, 3, ty_string, ty_real, ty_real);

iSteamFindLeaderboard   = external_define(working_directory+"\Steamworks.dll", "SteamFindLeaderboard", dll_cdecl, ty_real, 1, ty_string);
iSteamUploadLeaderboardScore = external_define(working_directory+"\Steamworks.dll", "SteamUploadScore", dll_cdecl, ty_real, 1, ty_real);

iSteamDownloadScores    = external_define(working_directory+"\Steamworks.dll", "SteamDownloadScores", dll_cdecl, ty_real, 0);
iSteamGetRankScore      = external_define(working_directory+"\Steamworks.dll", "SteamGetScoreForPosition", dll_cdecl, ty_real, 1, ty_real);
iSteamGetRankName       = external_define(working_directory+"\Steamworks.dll", "SteamGetNameForPosition", dll_cdecl, ty_string, 1, ty_real);
iSteamGetGlobalRank     = external_define(working_directory+"\Steamworks.dll", "SteamGetGlobalRankForPosition",   dll_cdecl, ty_real, 1, ty_real);

iSteamResetAllStats     = external_define(working_directory+"\Steamworks.dll", "SteamResetAllStats", dll_cdecl, ty_real, 1, ty_real);
iSteamIncStat           = external_define(working_directory+"\Steamworks.dll", "SteamIncreaseStat", dll_cdecl, ty_real, 2, ty_string, ty_real);
iSteamCheckFinal        = external_define(working_directory+"\Steamworks.dll", "SteamCheckFinal",    dll_cdecl, ty_real, 0);
global.steamon=1
global.steamreload=0
