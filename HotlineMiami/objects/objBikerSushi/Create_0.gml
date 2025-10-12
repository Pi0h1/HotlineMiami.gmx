image_speed = 0.2;
alarm[0] = 60;
state = 0;
message = 0;
wait = 30;

DoSave = function() {
	scrSaveGeneric(global.tempSave[room]);
	buffer_write( global.tempSave[room], buffer_u8, state );
	buffer_write( global.tempSave[room], buffer_f32, alarm[0] );
	buffer_write( global.tempSave[room], buffer_f32, wait );
}
DoLoad = function() {
	scrLoadGeneric(global.tempSave[room]);
	state = buffer_read(global.tempSave[room], buffer_u8 );
	alarm[0] = buffer_read(global.tempSave[room], buffer_f32 );
	wait = buffer_read(global.tempSave[room], buffer_f32 );
}