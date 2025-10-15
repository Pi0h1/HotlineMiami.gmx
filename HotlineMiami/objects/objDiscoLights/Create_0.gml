surf = surface_create(camera_get_view_width(view_camera[0]), camera_get_view_height(view_camera[0]));
global.strobe = 1;
strobeon = 0;
alarm[0] = 200;

DoSave = function(buf) {
	scrSaveGeneric(buf);
	buffer_write( buf, buffer_f32, alarm[0] );
	buffer_write( buf, buffer_f16, global.strobe );
	buffer_write( buf, buffer_u8, strobeon );
}
DoLoad = function(buf) {
	scrLoadGeneric(buf);
	alarm[0] = buffer_read(buf, buffer_f32 );
	global.strobe = buffer_read(buf, buffer_f16 );
	strobeon = buffer_read(buf, buffer_u8 );
}