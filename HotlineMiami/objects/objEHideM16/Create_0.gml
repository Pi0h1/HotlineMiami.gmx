image_speed = 0;
shake = 0;
image_index = 5;
energie = 0;
ammo = 20;

DoSave = function() {
	scrSaveGeneric(global.tempSave[room]);
	buffer_write( global.tempSave[room], buffer_f32, energie );
	buffer_write( global.tempSave[room], buffer_f32, ammo );
	buffer_write( global.tempSave[room], buffer_f32, shake );
}
DoLoad = function() {
	scrLoadGeneric(global.tempSave[room]);
	energie = buffer_read(global.tempSave[room], buffer_f32 );
	ammo = buffer_read(global.tempSave[room], buffer_f32 );
	shake = buffer_read(global.tempSave[room], buffer_f32 );
}