// This script creates a save point. It's meant to be used for restarting the level after death.
var file = working_directory+"\tempsave.sav"
if (global.useJson){
    SaveState_Furniture();
    SaveState_Enemies();
    SaveState_Player();
    SaveState_Effector();
    SaveState_Surface();
    SaveState_Score();
    SaveState_Weapons();
} else {
    game_save(file); // This is vanilla Hotline Miami's method
    show_debug_message("Saved game state using game_save to " + string(file));
}
