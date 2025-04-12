//scrLoadSounds()
//sleep(1000)
//window_set_fullscreen(true)
fade=0
amount=0
alarm[0]=110
/*i=0  sprite export code
repeat (1000) {
if sprite_exists(i) {
ii=0
repeat (sprite_get_number(i)) {
sprite_save(i,ii,working_directory+"\sprites\"+sprite_get_name(i)+string(ii)+".bmp")
ii+=1
}
}
i+=1
}*/
//global.steamon=0
scrSetPort()
global.mvol=1
scrLoadVol()
if file_exists(working_directory+"\\skip") {
global.currentsong=0
sxeasy_init();
sxeasy_play(working_directory+"\\HorseSteppin.mp3");
room_goto(rmMenu)
} else {
sxeasy_init();
file=file_text_open_write(working_directory+"\\skip")
file_text_close(file)
}
/* */
/*  */
