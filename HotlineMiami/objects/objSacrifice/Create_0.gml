image_speed = 0;
state = 0;
wait = 0;
xview = 0;
yview = 0;

DoSave = function() {
	scrSaveGeneric(global.tempSave[room]);
	buffer_write(global.tempSave[room], buffer_u8, state);
	buffer_write(global.tempSave[room], buffer_f32, wait);
	buffer_write(global.tempSave[room], buffer_f32, xview);
	buffer_write(global.tempSave[room], buffer_f32, yview);
}
DoLoad = function() {
	scrLoadGeneric(global.tempSave[room]);
	state = buffer_read(global.tempSave[room], buffer_u8);
	wait = buffer_read(global.tempSave[room], buffer_f32);
	xview = buffer_read(global.tempSave[room], buffer_f32);
	yview = buffer_read(global.tempSave[room], buffer_f32);
}