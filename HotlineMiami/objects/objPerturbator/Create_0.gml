image_speed = 0;
alarm[0] = 1 + random(1500);

DoSave = function() {
	buffer_write(global.tempSave[room], buffer_f16, image_speed);
	buffer_write(global.tempSave[room], buffer_f32, alarm[0]);
}
DoLoad = function() {
	scrLoadGeneric(global.tempSave[room]);
	image_speed = buffer_read(global.tempSave[room], buffer_f16);
	alarm[0] = buffer_read(global.tempSave[room], buffer_f32);
}