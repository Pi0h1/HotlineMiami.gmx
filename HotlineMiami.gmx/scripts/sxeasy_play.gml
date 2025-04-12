var lastsong;
if file_exists(working_directory+"\restartmusic") nothing=1 else audio_stop_sound(global.currentsong)

lastsong=global.currentsong
thissong=string_replace(argument0,"mp3","ogg")
//caster_set_volume(global.currentsong,sxeasy_setVolume)

global.currentsong=audio_create_stream(thissong)
audio_play_sound(global.currentsong,100,true)
audio_sound_gain(global.currentsong,global.mvol,0)

if string(lastsong)="" nothing=1 else {if file_exists(working_directory+"\restartmusic") nothing=1 else audio_destroy_stream(lastsong)}
