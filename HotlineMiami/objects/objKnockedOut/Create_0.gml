image_speed = 0;
friction = 0.1;
image_index = 1;
reload = 100 + random(120);
type = objEnemy;
startx = x;
starty = y;

DoSave = function() {
	buffer_write( global.tempSave[room], buffer_f32, reload );
	buffer_write( global.tempSave[room], buffer_f32, type );
	buffer_write( global.tempSave[room], buffer_f32, startx );
	buffer_write( global.tempSave[room], buffer_f32, starty );
	
}

DoLoad = function() {
	reload = buffer_read(global.tempSave[room], buffer_f32 );
	type = buffer_read(global.tempSave[room], buffer_f32 );
	startx = buffer_read(global.tempSave[room], buffer_f32 );
	starty = buffer_read(global.tempSave[room], buffer_f32 );
}