active = 0;
state = 0;
wait = 180;
dir = 0;
pickup = 0;

DoSave = function() {
	scrSaveGeneric(global.tempSave[room]);
	buffer_write( global.tempSave[room], buffer_u8, active );
	buffer_write( global.tempSave[room], buffer_u8, state );
	buffer_write( global.tempSave[room], buffer_f32, wait );
	buffer_write( global.tempSave[room], buffer_f32, dir );
	buffer_write( global.tempSave[room], buffer_u8, pickup );
	buffer_write( global.tempSave[room], buffer_u8, solid );


}
DoLoad = function() {
	scrLoadGeneric(global.tempSave[room]);
	active = buffer_read(global.tempSave[room], buffer_u8 );
	state = buffer_read(global.tempSave[room], buffer_u8 );
	wait = buffer_read(global.tempSave[room], buffer_f32 );
	dir = buffer_read(global.tempSave[room], buffer_f32 );
	pickup = buffer_read(global.tempSave[room], buffer_u8 );
	solid = buffer_read(global.tempSave[room], buffer_u8 );
}