bounced = 0;

DoSave = function() {
	scrSaveGeneric(global.tempSave[room]);
	buffer_write( global.tempSave[room], buffer_u8, bounced );


}
DoLoad = function() {
	scrLoadGeneric(global.tempSave[room]);
	bounced = buffer_read(global.tempSave[room], buffer_u8 );
}