image_speed = 0;
alert = 0;

DoSave = function() {
	buffer_write( global.tempSave[room], buffer_f32, alert );
}

DoLoad = function() {
	alert = buffer_read(global.tempSave[room], buffer_f32 );
}