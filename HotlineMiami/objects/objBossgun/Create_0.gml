image_angle = random(360);
image_speed = 0;
dir = random(360);
angle_speed = -1 + round(random(1)) * 2;
if (global.xbox)
    scrInitXboxButtons();

DoSave = function() {
	scrSaveGeneric(global.tempSave[room]);
	buffer_write( global.tempSave[room], buffer_f32, dir );
	buffer_write( global.tempSave[room], buffer_f32, angle_speed );
}
DoLoad = function() {
	scrLoadGeneric(global.tempSave[room]);
	dir = buffer_read(global.tempSave[room], buffer_f32 );
	angle_speed = buffer_read(global.tempSave[room], buffer_f32 );
}