// JSON Files
// ===============================
EraseFile("Furniture.sav");
EraseFile("Misc.sav");
EraseFile("Enemies.sav");
EraseFile("Player.sav");
EraseFile("Effector.sav");
EraseFile("Surface.sav");
EraseFile("SurfaceManager.sav");
EraseFile("Score.sav");
EraseFile("Weapons.sav");

// Hotline Miami Files
// ===============================
EraseFile("xbox");
EraseFile("steamon");
EraseFile("steamoff");
EraseFile("alienware");

if (global.steamon) {
SteamShutdown();
steamdll_free();
}

if (global.alienware) {
scrAlienWareFree();
}

sxeasy_close();      
with all game_end();
