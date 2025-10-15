dir = random(10000);


DoSave = function(buf) {
	buffer_write( buf, buffer_f32, dir );
}
DoLoad = function(buf) {
	dir = buffer_read(buf, buffer_f32 );
}