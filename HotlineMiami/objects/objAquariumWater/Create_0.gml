image_speed = 0;
image_alpha = 0.5;
frames = sprite_get_number(sprite_index);

DoSave = function() {
	buffer_write( global.tempSave[room], buffer_f16, image_speed );
	buffer_write( global.tempSave[room], buffer_f16, image_alpha );
	buffer_write( global.tempSave[room], buffer_f16, frames );
}
DoLoad = function() {
	image_speed = buffer_read(global.tempSave[room], buffer_f16 );
	image_alpha = buffer_read(global.tempSave[room], buffer_f16 );
	frames = buffer_read(global.tempSave[room], buffer_f16 );
}