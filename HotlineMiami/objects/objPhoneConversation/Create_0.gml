reload = 10;
current = 0;
index = 0;
skip = 0;
indexspeed = 0.15;
line1 = -1;
line2 = -1;//array_create(0);
messages = 0;

if (global.xbox)
    scrInitXboxButtons();

DoSave = function(buf) {
	buffer_write( buf, buffer_f32, reload );	
	buffer_write( buf, buffer_f32, current );
	buffer_write( buf, buffer_f16, index );
	buffer_write( buf, buffer_f32, skip );
	buffer_write( buf, buffer_f32, indexspeed );
	buffer_write( buf, buffer_u16, messages );
	var len = array_length(line1) ;
	buffer_write( buf, buffer_u16, len );
	for (var i = 0; i < len; ++i) {
		buffer_write( buf, buffer_string, line1[i]);
		buffer_write( buf, buffer_string, line2[i]);
	}
	
	
}

DoLoad = function(buf) {
	reload = buffer_read(buf, buffer_f32 );
	current = buffer_read(buf, buffer_f32 );
	index = buffer_read(buf, buffer_f16 );
	skip = buffer_read(buf, buffer_f32 );
	indexspeed = buffer_read(buf, buffer_f32 );
	messages = buffer_read(buf, buffer_u16 );
	var len = buffer_read(buf, buffer_u16 );
	line1 = array_create(len);
	line2 = array_create(len);
	for (i = 0; i < len; ++i) {
		line1[i] = buffer_read( buf, buffer_string);
		line2[i] = buffer_read( buf, buffer_string);
	}
}