startx = x;
starty = y;
direction = random(360);
speed = 4;
h = random(255);
color = make_color_hsv(h, 255, 255);
xlimit1 = 0;
ylimit1 = 0;
xlimit2 = 0;
ylimit2 = 0;


DoSave = function() {
	scrSaveGeneric(global.tempSave[room]);
	buffer_write( global.tempSave[room], buffer_f32, startx );
	buffer_write( global.tempSave[room], buffer_f32, starty );
	buffer_write( global.tempSave[room], buffer_f16, h );
	buffer_write( global.tempSave[room], buffer_f32, color );
	buffer_write( global.tempSave[room], buffer_f32, xlimit1 );
	buffer_write( global.tempSave[room], buffer_f32, ylimit1 );
	buffer_write( global.tempSave[room], buffer_f32, xlimit1 );
	buffer_write( global.tempSave[room], buffer_f32, ylimit2 );
}
DoLoad = function() {
	scrLoadGeneric(global.tempSave[room]);
	startx = buffer_read(global.tempSave[room], buffer_f32 );
	starty = buffer_read(global.tempSave[room], buffer_f32 );
	h = buffer_read(global.tempSave[room], buffer_f16 );
	color = buffer_read(global.tempSave[room], buffer_f32 );
	xlimit = buffer_read(global.tempSave[room], buffer_f32 );
	ylimit = buffer_read(global.tempSave[room], buffer_f32 );
	xlimit2 = buffer_read(global.tempSave[room], buffer_f32 );
	ylimit2 = buffer_read(global.tempSave[room], buffer_f32 );
}