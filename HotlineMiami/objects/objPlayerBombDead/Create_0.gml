friction = 0.1;
bled = 0;

DoSave = function(buf) {
	buffer_write( buf, buffer_f16, bled );
	buffer_write( buf, buffer_f32, friction );


}
DoLoad = function(buf) {
	bled = buffer_read(buf, buffer_f16 );
	friction = buffer_read(buf, buffer_f32 );
}