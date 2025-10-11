image_index = 0;
image_speed = 0;
on = 0;
wait = 0;
global.alarmsound = 0;

DoSave = function() {
	scrSaveGeneric(global.tempSave[room]);
	buffer_write( global.tempSave[room], buffer_u8, on );
	buffer_write( global.tempSave[room], buffer_f32, wait );
	buffer_write( global.tempSave[room], buffer_u8, global.alarmsound );
}
DoLoad = function() {
	scrLoadGeneric(global.tempSave[room]);
	on = buffer_read( global.tempSave[room], buffer_u8 );
	wait = buffer_read( global.tempSave[room], buffer_f32 );
	global.alarmsound = buffer_read( global.tempSave[room], buffer_u8 );
}