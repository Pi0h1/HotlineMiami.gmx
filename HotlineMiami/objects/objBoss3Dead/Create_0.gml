image_speed = 0.25;
wait = 40;
direction = 90;
objPlayer.visible = 0;
index = 0;

DoSave = function() {
	scrSaveGeneric(global.tempSave[room]);
	buffer_write(global.tempSave[room], buffer_f32, wait);
	buffer_write(global.tempSave[room], buffer_f16, index);
}
DoLoad = function () {
	scrLoadGeneric(global.tempSave[room]);
	wait = buffer_read(global.tempSave[room], buffer_f32);
	index = buffer_read(global.tempSave[room], buffer_f16);
}