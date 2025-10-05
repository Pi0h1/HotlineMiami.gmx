image_speed = 0;
on = 0;
global.done = 0;
alarm[0] = 2;
dir = 0;
if (global.xbox)
    scrInitXboxButtons();

DoSave = function() {
	scrSaveGeneric(global.tempSave[room]);
	buffer_write( global.tempSave[room], buffer_f32, on );
}
DoLoad = function() {
	scrLoadGeneric(global.tempSave[room]);
	on = buffer_read( global.tempSave[room], buffer_f32 );
}