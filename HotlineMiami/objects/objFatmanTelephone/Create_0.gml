image_speed = 0.05;
energie = 0;

DoSave = function() {
	buffer_write( global.tempSave[room], buffer_f32, image_speed );
	buffer_write( global.tempSave[room], buffer_f32, energie );
}

DoLoad = function() {
	image_speed = buffer_read(global.tempSave[room], buffer_f32 );
	energie = buffer_read(global.tempSave[room], buffer_f32 );
}