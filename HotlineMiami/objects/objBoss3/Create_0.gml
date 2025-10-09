image_speed = 0.06;
speed = 0.25;
alarm[0] = 80;

DoSave = function() {
	scrSaveGeneric(global.tempSave[room]);
	buffer_write(global.tempSave[room], buffer_f32, alarm[0]);
}
DoLoad = function () {
	scrLoadGeneric(global.tempSave[room]);
	alarm[0] = buffer_read(global.tempSave[room], buffer_f32);
}