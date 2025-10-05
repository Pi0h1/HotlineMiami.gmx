friction = 0.1;
rotspeed = (-1 + round(random(1)) * 2) * random(5);
startspeed = 0.1;

DoSave = function() {
	scrSaveGeneric(global.tempSave[room]);
	buffer_write( global.tempSave[room], buffer_f32, rotspeed );
	buffer_write( global.tempSave[room], buffer_f32, startspeed );
}
DoLoad = function() {
	scrLoadGeneric(global.tempSave[room]);
	rotspeed = buffer_read(global.tempSave[room], buffer_f32 );
	startspeed = buffer_read(global.tempSave[room], buffer_f32 );
}