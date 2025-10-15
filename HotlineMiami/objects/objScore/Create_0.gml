scale = 0.6;
done = 0;
vspeed = -0.5;
dir = random(1000);
global.comboflash = 0;
text = "";

DoSave = function(buf) {
	buffer_write( buf, buffer_f16, scale );
	buffer_write( buf, buffer_u8, done );
	buffer_write( buf, buffer_f32, dir );
	buffer_write( buf, buffer_u8, global.comboflash );
	buffer_write( buf, buffer_f32, vspeed );
	buffer_write( buf, buffer_string, text );


}
DoLoad = function(buf) {
	scale = buffer_read(buf, buffer_f16 );
	done = buffer_read(buf, buffer_u8 );
	dir = buffer_read(buf, buffer_f32 );
	global.comboflash = buffer_read(buf, buffer_u8 );
	vspeed = buffer_read(buf, buffer_f32 );
	text = buffer_read(buf, buffer_string );
}