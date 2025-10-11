image_speed = 0;
frames = sprite_get_number(sprite_index);

DoSave = function() {
	scrSaveGeneric(global.tempSave[room]);
	buffer_write( global.tempSave[room], buffer_f16, frames );
}
DoLoad = function() {
	scrLoadGeneric(global.tempSave[room]);
	frames = buffer_read(global.tempSave[room], buffer_f16 );
}