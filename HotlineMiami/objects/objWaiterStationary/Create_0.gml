image_speed = speed * 0.15;
ammo = 30;
checkreload = 10;
reload = 12;
energie = 0;

DoSave = function() {
	buffer_write( global.tempSave[room], buffer_f32, image_speed );
	buffer_write( global.tempSave[room], buffer_f32, energie );
	buffer_write( global.tempSave[room], buffer_f32, ammo );
	buffer_write( global.tempSave[room], buffer_f32, checkreload );
	buffer_write( global.tempSave[room], buffer_f32, reload );
}

DoLoad = function() {
	image_speed = buffer_read(global.tempSave[room], buffer_f32 );
	energie = buffer_read(global.tempSave[room], buffer_f32 );
	ammo = buffer_read(global.tempSave[room], buffer_f32 );
	checkreload = buffer_read(global.tempSave[room], buffer_f32 );
	reload = buffer_read(global.tempSave[room], buffer_f32 );
}