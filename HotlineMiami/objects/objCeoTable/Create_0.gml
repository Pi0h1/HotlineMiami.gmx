image_speed = 0.35;
dir = 0;
active = 1;
state = 0;
if (global.xbox)
    scrInitXboxButtons();

DoSave = function(buf) {
	scrSaveGeneric(buf);
	buffer_write( buf, buffer_u8, state );
	buffer_write( buf, buffer_u8, active );
	buffer_write( buf, buffer_f32, dir );
	buffer_write( buf, buffer_f32, alarm[0] );
}
DoLoad = function(buf) {
	scrLoadGeneric(buf);
	state = buffer_read(buf, buffer_u8 );
	active = buffer_read(buf, buffer_u8 );
	dir = buffer_read(buf, buffer_f32 );
	alarm[0] = buffer_read(buf, buffer_f32 );
}