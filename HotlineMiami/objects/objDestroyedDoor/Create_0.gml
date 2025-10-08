image_speed = 0;
friction = 0.15;
broke = 0;;

DoSave = function() {
	scrSaveGeneric(global.tempSave[room]);
	buffer_write( global.tempSave[room], buffer_u8, broke );
}
DoLoad = function() {
	scrLoadGeneric(global.tempSave[room]);
	broke = buffer_read(global.tempSave[room], buffer_u8 );
}