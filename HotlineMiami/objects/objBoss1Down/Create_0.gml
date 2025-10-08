image_speed = 0;
friction = 0.1;
wait = 60;
dead = 0;

DoSave = function() {
	scrSaveGeneric(global.tempSave[room]);
	buffer_write( global.tempSave[room], buffer_f32, wait );
	buffer_write( global.tempSave[room], buffer_u8, dead );


}
DoLoad = function() {
	scrLoadGeneric(global.tempSave[room]);
	wait = buffer_read(global.tempSave[room], buffer_f32 );
	dead = buffer_read(global.tempSave[room], buffer_u8 );
}