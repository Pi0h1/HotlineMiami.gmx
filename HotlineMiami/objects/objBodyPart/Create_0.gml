image_speed = 0;
friction = 0.1;
image_yscale = -1 + round(random(1)) * 2;
bled = 0;
//wait = random(100);
rotspeed = -1 + round(random(1)) * 2;
wait = 100;

DoSave = function() {
	scrSaveGeneric(global.tempSave[room]);
	buffer_write( global.tempSave[room], buffer_f32, bled );
	buffer_write( global.tempSave[room], buffer_f32, wait );
	buffer_write( global.tempSave[room], buffer_f32, rotspeed );
}
DoLoad = function() {
	scrLoadGeneric(global.tempSave[room]);
	bled = buffer_read(global.tempSave[room], buffer_f32 );
	wait = buffer_read(global.tempSave[room], buffer_f32 );
	rotspeed = buffer_read(global.tempSave[room], buffer_f32 );
}