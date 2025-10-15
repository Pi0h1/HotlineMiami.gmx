swats = 4;

DoSave = function(buf) {
	scrSaveGeneric(buf);
	buffer_write( buf, buffer_u8, swats );
	buffer_write( buf, buffer_f32, alarm[0] );
}
DoLoad = function(buf) {
	scrLoadGeneric(buf);
	swats = buffer_read(buf, buffer_u8 );
	alarm[0] = buffer_read(buf, buffer_f32 );
}