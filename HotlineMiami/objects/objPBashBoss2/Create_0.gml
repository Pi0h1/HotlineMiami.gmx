hurtindex = 0;
targetindex = 0;
image_speed = 0;

DoSave = function(buf) {
	scrSaveGeneric(buf);
	buffer_write( buf, buffer_f32, hurtindex );
	buffer_write( buf, buffer_f32, targetindex );


}
DoLoad = function(buf) {
	scrLoadGeneric(buf);
	hurtindex = buffer_read(buf, buffer_f16 );
	targetindex = buffer_read(buf, buffer_f16 );
}