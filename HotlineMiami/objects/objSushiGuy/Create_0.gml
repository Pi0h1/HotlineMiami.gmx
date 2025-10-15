on = 1;
image_speed = 0.15;

DoSave = function(buf) {
	scrSaveGeneric(buf);
	buffer_write( buf, buffer_u8, on );
}
DoLoad = function(buf) {
	scrLoadGeneric(buf);
	on = buffer_read(buf, buffer_u8 );
}