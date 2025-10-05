image_speed = 0.2;
image_index = 1;
ripped = false;

DoSave = function() {
	scrSaveGeneric(global.tempSave[room]);
	buffer_write( global.tempSave[room], buffer_u8, ripped );

}
DoLoad = function() {
	scrLoadGeneric(global.tempSave[room]);
	ripped = buffer_read(global.tempSave[room], buffer_u8 );
}