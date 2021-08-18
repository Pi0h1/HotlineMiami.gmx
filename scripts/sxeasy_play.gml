var lastsong;
if file_exists(working_directory+"\restartmusic") {} else {audio_stop_sound(global.currentsong)}
lastsong=global.currentsong
thissong=string_replace(argument0,"mp3","ogg")
global.currentsong=audio_create_stream(thissong)
PlayBGM(global.currentsong)
audio_sound_gain(global.currentsong,global.mvol,0)
if string(lastsong)="" nothing=1 else {if file_exists(working_directory+"\restartmusic") nothing=1 else audio_destroy_stream(lastsong)}
