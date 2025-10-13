scale = 0.6;
done = 0;
vspeed = -0.5;
dir = random(1000);
global.comboflash = 0;
text = "";

DoSave = function() {
	buffer_write( global.tempSave[room], buffer_f16, scale );
	buffer_write( global.tempSave[room], buffer_u8, done );
	buffer_write( global.tempSave[room], buffer_f32, dir );
	buffer_write( global.tempSave[room], buffer_u8, global.comboflash );
	buffer_write( global.tempSave[room], buffer_f32, vspeed );
	buffer_write( global.tempSave[room], buffer_string, text );


}
DoLoad = function() {
	scale = buffer_read(global.tempSave[room], buffer_f16 );
	done = buffer_read(global.tempSave[room], buffer_u8 );
	dir = buffer_read(global.tempSave[room], buffer_f32 );
	global.comboflash = buffer_read(global.tempSave[room], buffer_u8 );
	vspeed = buffer_read(global.tempSave[room], buffer_f32 );
	text = buffer_read(global.tempSave[room], buffer_string );
}