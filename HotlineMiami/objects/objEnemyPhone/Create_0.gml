image_speed = 0;
image_index = 0;
reload = floor(random(10));
alert = 0;
direction = random(360);
ammo = 0;
path = path_add();
on = 0;

DoSave = function() {
	scrSaveGeneric(global.tempSave[room]);
	buffer_write( global.tempSave[room], buffer_f32, reload );
	buffer_write( global.tempSave[room], buffer_f32, alert );
	buffer_write( global.tempSave[room], buffer_f32, ammo );
	buffer_write( global.tempSave[room], buffer_u8, on );
}

DoLoad = function() {
	scrLoadGeneric(global.tempSave[room]);
	reload = buffer_read(global.tempSave[room], buffer_f32 );
	alert = buffer_read(global.tempSave[room], buffer_f32 );
	ammo = buffer_read(global.tempSave[room], buffer_f32 );
	on = buffer_read(global.tempSave[room], buffer_u8 );
}	