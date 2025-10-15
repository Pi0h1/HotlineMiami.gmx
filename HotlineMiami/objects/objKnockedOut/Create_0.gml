image_speed = 0;
friction = 0.1;
image_index = 1;
reload = 100 + random(120);
type = objEnemy;
startx = x;
starty = y;

DoSave = function(buf) {
	buffer_write( buf, buffer_f32, reload );
	buffer_write( buf, buffer_f32, type );
	buffer_write( buf, buffer_f32, startx );
	buffer_write( buf, buffer_f32, starty );
	
}

DoLoad = function(buf) {
	reload = buffer_read(buf, buffer_f32 );
	type = buffer_read(buf, buffer_f32 );
	startx = buffer_read(buf, buffer_f32 );
	starty = buffer_read(buf, buffer_f32 );
}