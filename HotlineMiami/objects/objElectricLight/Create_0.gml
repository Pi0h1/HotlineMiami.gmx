r = 20;

DoSave = function() {
	buffer_write( global.tempSave[room], buffer_f32, r );
}
DoLoad = function() {
	r = buffer_read(global.tempSave[room], buffer_f32 );
}