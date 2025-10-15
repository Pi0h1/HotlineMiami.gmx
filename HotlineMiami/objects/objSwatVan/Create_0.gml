image_speed = 0;
spawn = 0;
visible = 0;

DoSave = function(buf) {
	scrSaveGeneric(buf);
	buffer_write( buf, buffer_u8, spawn );
	buffer_write( buf, buffer_u8, solid );
}
DoLoad = function(buf) {
	scrLoadGeneric(buf);
	spawn = buffer_read(buf, buffer_u8 );
	solid = buffer_read(buf, buffer_u8 );
}