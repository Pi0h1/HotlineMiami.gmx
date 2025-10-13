image_speed = 0;
alarm[0] = 1 + random(900);

DoSave = function() {
	scrSaveGeneric(global.tempSave[room]);
	buffer_write(global.tempSave[room], buffer_f32, alarm[0]);
	buffer_write(global.tempSave[room], buffer_f32, alarm[1]);
}
DoLoad = function() {
	scrLoadGeneric(global.tempSave[room]);
	alarm[0] = buffer_read(global.tempSave[room], buffer_f32);
	alarm[1] = buffer_read(global.tempSave[room], buffer_f32);
}