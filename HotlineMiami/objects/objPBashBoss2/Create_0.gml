hurtindex = 0;
targetindex = 0;
image_speed = 0;

DoSave = function() {
	scrSaveGeneric(global.tempSave[room]);
	buffer_write( global.tempSave[room], buffer_f32, hurtindex );
	buffer_write( global.tempSave[room], buffer_f32, targetindex );


}
DoLoad = function() {
	scrLoadGeneric(global.tempSave[room]);
	hurtindex = buffer_read(global.tempSave[room], buffer_f32 );
	targetindex = buffer_read(global.tempSave[room], buffer_f32 );
}