image_speed = 0.1;
shotgunned = 0;
hits = 0;
blood = 120;
//wait = 0;
reload = 0;

state = 0;
wait = 40;
path = -1234;

alarm[0] = 1;
ammo = 10;
scrInitPathFinding();

DoSave = function() {
	scrSaveGeneric(global.tempSave[room]);
	buffer_write( global.tempSave[room], buffer_f32, shotgunned );
	buffer_write( global.tempSave[room], buffer_f32, hits );
	buffer_write( global.tempSave[room], buffer_f32, blood );
	buffer_write( global.tempSave[room], buffer_f32, wait );
	buffer_write( global.tempSave[room], buffer_f32, reload );
	buffer_write( global.tempSave[room], buffer_f32, state );
	buffer_write( global.tempSave[room], buffer_f32, path );
}
DoLoad = function() {
	scrLoadGeneric(global.tempSave[room]);
	shotgunned = buffer_read(global.tempSave[room], buffer_f32 );
	hits = buffer_read(global.tempSave[room], buffer_f32 );
	blood = buffer_read(global.tempSave[room], buffer_f32 );
	wait = buffer_read(global.tempSave[room], buffer_f32 );
	reload = buffer_read(global.tempSave[room], buffer_f32 );
	state = buffer_read(global.tempSave[room], buffer_f32 );
	path = buffer_read(global.tempSave[room], buffer_f32 );
}