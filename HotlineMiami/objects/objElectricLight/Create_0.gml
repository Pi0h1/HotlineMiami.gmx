r = 20;

DoSave = function(buf) {
	buffer_write( buf, buffer_f32, r );
}
DoLoad = function(buf) {
	r = buffer_read(buf, buffer_f32 );
}