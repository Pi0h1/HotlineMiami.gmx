image_angle = random(360);
image_speed = 0;
dir = 0;

DoSave = function() {
	buffer_write(global.tempSave[room], buffer_f16, image_index);
	buffer_write(global.tempSave[room], buffer_f16, image_angle);
	buffer_write(global.tempSave[room], buffer_f32, dir);
}
DoLoad = function() {
	image_index = buffer_read(global.tempSave[room], buffer_f16);
	image_angle = buffer_read(global.tempSave[room], buffer_f16);
	dir = buffer_read(global.tempSave[room], buffer_f32);
}