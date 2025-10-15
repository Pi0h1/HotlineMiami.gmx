smirked = 0;
image_speed = 0.085;
state = 0;
vol = 1;
viewx = camera_get_view_x(view_camera[0]);
viewy = camera_get_view_y(view_camera[0]);

DoSave = function(buf) {
	scrSaveGeneric(buf);
	buffer_write( buf, buffer_u8, smirked );
	buffer_write( buf, buffer_f16, vol );
	buffer_write( buf, buffer_u8, state );
	buffer_write( buf, buffer_f32, viewx );
	buffer_write( buf, buffer_f32, viewy );
}
DoLoad = function(buf) {
	scrLoadGeneric(buf);
	smirked = buffer_read(buf, buffer_u8 );
	vol = buffer_read(buf, buffer_f16 );
	state = buffer_read(buf, buffer_u8 );
	viewx = buffer_read(buf, buffer_f32 );
	viewy = buffer_read(buf, buffer_f32 );
}