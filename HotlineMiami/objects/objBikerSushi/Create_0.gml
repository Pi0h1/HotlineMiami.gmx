image_speed = 0.2;
alarm[0] = 60;
state = 0;
message = 0;
wait = 30;

DoSave = function(buf) {
	scrSaveGeneric(buf);
	buffer_write( buf, buffer_u8, state );
	buffer_write( buf, buffer_f32, alarm[0] );
	buffer_write( buf, buffer_f32, wait );
}
DoLoad = function(buf) {
	scrLoadGeneric(buf);
	state = buffer_read(buf, buffer_u8 );
	alarm[0] = buffer_read(buf, buffer_f32 );
	wait = buffer_read(buf, buffer_f32 );
}