dir = random(10000);


DoSave = function() {
	buffer_write( global.tempSave[room], buffer_f32, dir );
}
DoLoad = function() {
	dir = buffer_read(global.tempSave[room], buffer_f32 );
}