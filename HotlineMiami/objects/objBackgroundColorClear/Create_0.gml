dir = random(1000);
color1 = c_black;
color2 = c_black;
if (global.alienware)
    scrAlienWareYellow();

DoSave = function() {
	buffer_write( global.tempSave[room], buffer_f32, dir );
	buffer_write( global.tempSave[room], buffer_f32, color1 );
	buffer_write( global.tempSave[room], buffer_f32, color2 );


}
DoLoad = function() {
	dir = buffer_read(global.tempSave[room], buffer_f32 );
	color1 = buffer_read(global.tempSave[room], buffer_f32 );
	color2 = buffer_read(global.tempSave[room], buffer_f32 );
}