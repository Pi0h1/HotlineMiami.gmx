surf = surface_create(camera_get_view_width(view_camera[0]), camera_get_view_height(view_camera[0]));
global.strobe = 1;
strobeon = 0;
alarm[0] = 200;

DoSave = function() {
	scrSaveGeneric(global.tempSave[room]);
	buffer_write( global.tempSave[room], buffer_f32, alarm[0] );
	buffer_write( global.tempSave[room], buffer_f16, global.strobe );
	buffer_write( global.tempSave[room], buffer_u8, strobeon );
}
DoLoad = function() {
	scrLoadGeneric(global.tempSave[room]);
	alarm[0] = buffer_read(global.tempSave[room], buffer_f32 );
	global.strobe = buffer_read(global.tempSave[room], buffer_f16 );
	strobeon = buffer_read(global.tempSave[room], buffer_u8 );
}