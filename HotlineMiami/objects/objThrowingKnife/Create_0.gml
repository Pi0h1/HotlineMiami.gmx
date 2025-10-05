angle = random(360);
image_speed = 0;
bounced = 0;
dir_add = -1 + round(random(1)) * 2;

DoSave = function() {
	scrSaveGeneric(global.tempSave[room]);
	buffer_write(global.tempSave[room], buffer_f32, angle);
	buffer_write(global.tempSave[room], buffer_u8, bounced);
	buffer_write(global.tempSave[room], buffer_f32, dir_add);
}
DoLoad = function () {
	angle = buffer_read(global.tempSave[room], buffer_f32);
	bounced = buffer_read(global.tempSave[room], buffer_u8);
	dir_add = buffer_read(global.tempSave[room], buffer_f32);
}