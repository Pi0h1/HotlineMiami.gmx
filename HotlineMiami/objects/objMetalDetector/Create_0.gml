image_index = 0;
image_speed = 0;
on = 0;
wait = 0;
global.alarmsound = 0;

DoSave = function(buf) {
	scrSaveGeneric(buf);
	buffer_write( buf, buffer_u8, on );
	buffer_write( buf, buffer_f32, wait );
	buffer_write( buf, buffer_u8, global.alarmsound );
}
DoLoad = function(buf) {
	scrLoadGeneric(buf);
	on = buffer_read( buf, buffer_u8 );
	wait = buffer_read( buf, buffer_f32 );
	global.alarmsound = buffer_read( buf, buffer_u8 );
}