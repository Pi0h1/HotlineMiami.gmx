image_speed = 0.2;
start_x = 0;
start_y = 0;
addx = 0;
addy = 0;

DoSave = function() {
	scrSaveGeneric(global.tempSave[room]);
	buffer_write( global.tempSave[room], buffer_f32, start_x );
	buffer_write( global.tempSave[room], buffer_f32, start_y );
	buffer_write( global.tempSave[room], buffer_f32, addx );
	buffer_write( global.tempSave[room], buffer_f32, addy );
}
DoLoad = function() {
	scrLoadGeneric(global.tempSave[room]);
	start_x = buffer_read(global.tempSave[room], buffer_f32 );
	start_y = buffer_read(global.tempSave[room], buffer_f32 );
	addx = buffer_read(global.tempSave[room], buffer_f32 );
	addy = buffer_read(global.tempSave[room], buffer_f32 );
}