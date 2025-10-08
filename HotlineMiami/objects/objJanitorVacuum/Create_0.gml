smirked = 0;
image_speed = 0.085;
state = 0;
vol = 1;
viewx = camera_get_view_x(view_camera[0]);
viewy = camera_get_view_y(view_camera[0]);

DoSave = function() {
	scrSaveGeneric(global.tempSave[room]);
	buffer_write( global.tempSave[room], buffer_u8, smirked );
	buffer_write( global.tempSave[room], buffer_f16, vol );
	buffer_write( global.tempSave[room], buffer_u8, state );
	buffer_write( global.tempSave[room], buffer_f32, viewx );
	buffer_write( global.tempSave[room], buffer_f32, viewy );
}
DoLoad = function() {
	scrLoadGeneric(global.tempSave[room]);
	smirked = buffer_read(global.tempSave[room], buffer_u8 );
	vol = buffer_read(global.tempSave[room], buffer_f16 );
	state = buffer_read(global.tempSave[room], buffer_u8 );
	viewx = buffer_read(global.tempSave[room], buffer_f32 );
	viewy = buffer_read(global.tempSave[room], buffer_f32 );
}