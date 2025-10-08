swingspeed = 0;
y += 5;
swinger = 0;

DoSave = function() {
	buffer_write( global.tempSave[room], buffer_u32, sprite_index );
	buffer_write( global.tempSave[room], buffer_f32, image_angle );
	buffer_write( global.tempSave[room], buffer_f32, swingspeed );
	buffer_write( global.tempSave[room], buffer_f32, swinger );
	buffer_write( global.tempSave[room], buffer_u8, solid );
}
DoLoad = function() {
	sprite_index = buffer_read(global.tempSave[room], buffer_u32 );
	image_angle = buffer_read(global.tempSave[room], buffer_f32 );
	swingspeed = buffer_read(global.tempSave[room], buffer_f32 );
	swinger = buffer_read(global.tempSave[room], buffer_f32 );
	solid = buffer_read(global.tempSave[room], buffer_u8 );
}