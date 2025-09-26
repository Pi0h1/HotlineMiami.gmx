image_speed = 0.5;
image_blend = merge_color(c_white, c_yellow, random(1));
passed = 0;
caliber = 0;
global.noguns = 0;
startx = x;
starty = y;
swat = 0;

DoSave = function() {
	scrSaveGeneric(global.tempSave[room]);
	buffer_write( global.tempSave[room], buffer_f32, passed );
	buffer_write( global.tempSave[room], buffer_f32, caliber );
	buffer_write( global.tempSave[room], buffer_f32, startx );
	buffer_write( global.tempSave[room], buffer_f32, starty );
	buffer_write( global.tempSave[room], buffer_f32, swat );
	
}
DoLoad = function() {
	scrLoadGeneric(global.tempSave[room]);
	passed = buffer_read(global.tempSave[room], buffer_f32 );
	caliber = buffer_read(global.tempSave[room], buffer_f32 );
	startx = buffer_read(global.tempSave[room], buffer_f32 );
	starty = buffer_read(global.tempSave[room], buffer_f32 );
	swat = buffer_read(global.tempSave[room], buffer_f32 );
}