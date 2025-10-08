dir = 0;
taken = 0;
if (global.masks[23] == 1)
    taken = 1;
image_speed = 0;

DoSave = function() {
	scrSaveGeneric(global.tempSave[room]);
	buffer_write(global.tempSave[room], buffer_u8, taken);
	buffer_write(global.tempSave[room], buffer_f32, dir);
}
DoLoad = function() {
	scrLoadGeneric(global.tempSave[room]);
	taken = buffer_read(global.tempSave[room], buffer_u8);
	dir = buffer_read(global.tempSave[room], buffer_f32);
}