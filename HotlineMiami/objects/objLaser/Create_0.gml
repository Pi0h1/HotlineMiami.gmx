dir = 0;
start_y = y;
ldir = 0;
stop = 0;
on = 0;

DoSave = function() {
	buffer_write( global.tempSave[room], buffer_f32, start_y );
	buffer_write( global.tempSave[room], buffer_f32, dir );
	buffer_write( global.tempSave[room], buffer_f32, ldir );
	buffer_write( global.tempSave[room], buffer_u8, on );
	buffer_write( global.tempSave[room], buffer_u8, stop );
}
DoLoad = function() {
	start_y = buffer_read(global.tempSave[room], buffer_f32 );
	dir = buffer_read(global.tempSave[room], buffer_f32 );
	ldir = buffer_read(global.tempSave[room], buffer_f32 );
	on = buffer_read(global.tempSave[room], buffer_u8 );
	stop = buffer_read(global.tempSave[room], buffer_u8 );
}