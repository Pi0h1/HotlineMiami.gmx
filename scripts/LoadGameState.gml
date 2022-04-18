var file = working_directory+"\tempsave.sav"
if (global.useJson){
    LoadState_Furniture();
    LoadState_Enemies();
    LoadState_Player();
    LoadState_Effector();
    LoadState_Surface();
    LoadState_SurfaceManager();
    LoadState_Score();
    LoadState_Weapons();
    LoadState_Misc();
    DestroyTheseObjects();
} else {
    game_load(file); // This is vanilla Hotline Miami's method
    show_debug_message("Loaded game state using game_load from " + string(file))
}
