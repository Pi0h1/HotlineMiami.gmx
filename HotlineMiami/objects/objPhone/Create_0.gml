image_speed = 0;
dir = random(360);
called = 0;
wait = 160;
answered = 0;


DoSave = function() {
	scrSaveGeneric(global.tempSave[room]);
	buffer_write( global.tempSave[room], buffer_f32, dir );
	buffer_write( global.tempSave[room], buffer_u8, called );
	buffer_write( global.tempSave[room], buffer_f32, wait );
	buffer_write( global.tempSave[room], buffer_u8, answered );
	buffer_write( global.tempSave[room], buffer_f32, alarm[0] );
	buffer_write( global.tempSave[room], buffer_f32, alarm[1] );
}
DoLoad = function() {
	scrLoadGeneric(global.tempSave[room]);
	dir = buffer_read(global.tempSave[room], buffer_u8 );
	called = buffer_read(global.tempSave[room], buffer_f32 );
	wait = buffer_read(global.tempSave[room], buffer_u8 );
	alarm[0] = buffer_read(global.tempSave[room], buffer_f32 );
	alarm[1] = buffer_read(global.tempSave[room], buffer_f32 );
}