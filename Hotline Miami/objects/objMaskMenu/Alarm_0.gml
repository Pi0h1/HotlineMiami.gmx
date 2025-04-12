//if room=rmSwatDownstairs instance_deactivate_object(objSwat)
test=objPlayer.persistent
objPlayer.persistent=0
global.loaded=1
scrSaveGame();
global.loaded=0
objPlayer.persistent=test
global.maskload=0
