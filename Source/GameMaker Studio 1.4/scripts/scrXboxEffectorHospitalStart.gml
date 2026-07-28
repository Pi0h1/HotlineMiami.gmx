
if fade=0 and amount=180 {
if instance_exists(objPlayer) {
if objPlayer.persistent=1 objPlayer.persistent=0
}
global.lastroom=room
room_persistent=1
screen_save(working_directory+"\pause.bmp")
global.sprite=sprite_add(working_directory+"\pause.bmp",0,0,0,0,1)
room=rmPause
}
