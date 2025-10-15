image_speed = 0.1;
energie = 0;

DoSave = function(buf) {
	buffer_write( buf, buffer_f32, image_speed );
	buffer_write( buf, buffer_f32, energie );
}

DoLoad = function(buf) {
	image_speed = buffer_read(buf, buffer_f32 );
	energie = buffer_read(buf, buffer_f32 );
}