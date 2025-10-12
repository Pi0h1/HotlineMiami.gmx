image_speed = 0.15;
image_index = 1;
energie = 0;

DoSave = function() {
	scrSaveGeneric(global.tempSave[room]);
	buffer_write( global.tempSave[room], buffer_f32, wait );
	buffer_write( global.tempSave[room], buffer_f32, energie );


}
DoLoad = function() {
	scrLoadGeneric(global.tempSave[room]);
	wait = buffer_read(global.tempSave[room], buffer_f32 );
	energie = buffer_read(global.tempSave[room], buffer_f32 );
}