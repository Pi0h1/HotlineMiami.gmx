dir = 0;
sprite = sprGoArrow;
addx = 0;
addy = 0;
movex = 0;
movey = 0;

DoSave = function() {
	scrSaveGeneric(global.tempSave[room]);
	buffer_write( global.tempSave[room], buffer_u32, sprite );
	buffer_write( global.tempSave[room], buffer_f32, addx );
	buffer_write( global.tempSave[room], buffer_f32, addy );
	buffer_write( global.tempSave[room], buffer_f32, movex );
	buffer_write( global.tempSave[room], buffer_f32, movey );
	buffer_write( global.tempSave[room], buffer_f32, dir );
	buffer_write( global.tempSave[room], buffer_u32, nextroom );
}
DoLoad = function() {
	scrLoadGeneric(global.tempSave[room]);
	sprite = buffer_read(global.tempSave[room], buffer_u32 );
	addx = buffer_read(global.tempSave[room], buffer_f32 );
	addy = buffer_read(global.tempSave[room], buffer_f32 );
	movex = buffer_read(global.tempSave[room], buffer_f32 );
	movey = buffer_read(global.tempSave[room], buffer_f32 );
	dir = buffer_read(global.tempSave[room], buffer_f32 );
	nextroom = buffer_read(global.tempSave[room], buffer_u32 );
}