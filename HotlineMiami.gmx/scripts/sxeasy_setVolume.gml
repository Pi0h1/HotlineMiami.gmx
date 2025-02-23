/*Shaltif's Xtreme Music and Sound
--The Fmod / WinAmp Wrapper for Game Maker
--Brandon Rohrer � 2003-2006
============================================
sxeasy_setVolume(vol);
===
argument0 = REAL - The volume (0.0 to 1.0)
===
return = REAL - Successful (1) or failure (0);
*/
//bgm_vol(global.currentsong,(argument0*100)*global.mvol)


//audio_sound_gain(global.currentsong,(argument0/100)+global.mvol*2,0)
audio_sound_gain(global.currentsong,(argument0/100)+global.mvol,0)


//if (!sxms.easyPlay) { return 0; };
//sxfmod_channel_setVolume()
//return external_call(sxms.dll_sxfmod_channel_setVolume,sxms.easyChannel,argument0);

