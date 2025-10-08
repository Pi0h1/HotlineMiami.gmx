image_speed = 0;
spawned = 0;
global.test = 0;

DoSave = function() {
	buffer_write(global.tempSave[room], buffer_f32, spawned);
	buffer_write(global.tempSave[room], buffer_f16, image_speed);
	buffer_write(global.tempSave[room], buffer_u8, global.test);
	buffer_write(global.tempSave[room], buffer_f32, alarm[0]);
}
DoLoad = function() {
	spawned = buffer_read(global.tempSave[room], buffer_f32);
	image_speed = buffer_read(global.tempSave[room], buffer_f16);
	global.test = buffer_read(global.tempSave[room], buffer_u8);
	alarm[0] = buffer_read(global.tempSave[room], buffer_f32);
}