friction = 0.1;
diradd = -1 + round(random(1)) * 2;
angle = random(360);
left = -1 + round(random(1)) * 2;
image_speed = 0;
ammo = 0;
hits = 0;
bounce = 0;

DoSave = function() {
	scrSaveGeneric(global.tempSave[room]);
	buffer_write( global.tempSave[room], buffer_f32, ammo );
	buffer_write( global.tempSave[room], buffer_f32, diradd );
	buffer_write( global.tempSave[room], buffer_f32, angle );
	buffer_write( global.tempSave[room], buffer_f32, left );
	buffer_write( global.tempSave[room], buffer_f32, hits );
	buffer_write( global.tempSave[room], buffer_f32, bounce );
	
}
DoLoad = function() {
	scrLoadGeneric(global.tempSave[room]);
	ammo = buffer_read(global.tempSave[room], buffer_f32 );
	diradd = buffer_read(global.tempSave[room], buffer_f32 );
	angle = buffer_read(global.tempSave[room], buffer_f32 );
	left = buffer_read(global.tempSave[room], buffer_f32 );
	hits = buffer_read(global.tempSave[room], buffer_f32 );
	bounce = buffer_read(global.tempSave[room], buffer_f32 );
}