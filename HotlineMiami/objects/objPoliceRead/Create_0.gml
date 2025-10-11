image_speed = 0;
alarm[0] = 100;
on = 0;
test = 0;
global.doctor = -1234;

DoSave = function() {
	scrSaveGeneric(global.tempSave[room]);
	buffer_write(global.tempSave[room], buffer_f32, alarm[0]);
	buffer_write(global.tempSave[room], buffer_u8, on);
	buffer_write(global.tempSave[room], buffer_u8, test);
}
DoLoad = function() {
	scrLoadGeneric(global.tempSave[room]);
	alarm[0] = buffer_read(global.tempSave[room], buffer_f32);
	on = buffer_read(global.tempSave[room], buffer_u8);
	test = buffer_read(global.tempSave[room], buffer_u8);
}