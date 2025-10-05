image_speed = 0;
spawned = 0;

DoSave = function() {
	buffer_write(global.tempSave[room], buffer_u8, spawned);
	buffer_write(global.tempSave[room], buffer_f16, image_speed);
	buffer_write(global.tempSave[room], buffer_u8, visible);
}
DoLoad = function() {
	spawned = buffer_read(global.tempSave[room], buffer_u8);
	image_speed = buffer_read(global.tempSave[room], buffer_f16);
	visible = buffer_read(global.tempSave[room], buffer_u8);
}