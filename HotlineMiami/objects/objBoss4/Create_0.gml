state = 0;
wait = 60;
dir = 0;
ammo = 0;
image_speed = 0;
alarm[0] = 100 + random(200);
global.done = 0;
scrInitPathFinding();

DoSave = function() {
	scrSaveGeneric(global.tempSave[room]);
	buffer_write( global.tempSave[room], buffer_u16, state );
	buffer_write( global.tempSave[room], buffer_f32, wait );
	buffer_write( global.tempSave[room], buffer_f32, alarm[0] );
	buffer_write( global.tempSave[room], buffer_f32, dir );
	buffer_write( global.tempSave[room], buffer_f32, ammo );

}
DoLoad = function() {
	scrLoadGeneric(global.tempSave[room]);
	state = buffer_read(global.tempSave[room], buffer_u16 );
	wait = buffer_read(global.tempSave[room], buffer_f32 );
	alarm[0] = buffer_read(global.tempSave[room], buffer_f32 );
	dir = buffer_read(global.tempSave[room], buffer_f32 );
	ammo = buffer_read(global.tempSave[room], buffer_f32 );
}