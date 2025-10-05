dir = random(1000);
if (global.alienware)
    scrAlienWarePink();
lastbonus = global.bonustime;
amount = 0;
color1 = c_white;
color2 = c_white;

DoSave = function() {
	buffer_write( global.tempSave[room], buffer_f32, dir );
	buffer_write( global.tempSave[room], buffer_f32, lastbonus );
	buffer_write( global.tempSave[room], buffer_f32, color1 );
	buffer_write( global.tempSave[room], buffer_f32, color2 );
	buffer_write( global.tempSave[room], buffer_f32, amount );


}
DoLoad = function() {
	dir = buffer_read(global.tempSave[room], buffer_f32 );
	lastbonus = buffer_read(global.tempSave[room], buffer_f32 );
	color1 = buffer_read(global.tempSave[room], buffer_f32 );
	color2 = buffer_read(global.tempSave[room], buffer_f32 );
	amount = buffer_read(global.tempSave[room], buffer_f32 );
}