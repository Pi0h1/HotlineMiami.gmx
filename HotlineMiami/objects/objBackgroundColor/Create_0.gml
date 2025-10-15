dir = random(1000);
if (global.alienware)
    scrAlienWarePink();
lastbonus = global.bonustime;
amount = 0;
color1 = c_white;
color2 = c_white;

DoSave = function(buf) {
	buffer_write( buf, buffer_f32, dir );
	buffer_write( buf, buffer_f32, lastbonus );
	buffer_write( buf, buffer_f32, color1 );
	buffer_write( buf, buffer_f32, color2 );
	buffer_write( buf, buffer_f32, amount );


}
DoLoad = function(buf) {
	dir = buffer_read(buf, buffer_f32 );
	lastbonus = buffer_read(buf, buffer_f32 );
	color1 = buffer_read(buf, buffer_f32 );
	color2 = buffer_read(buf, buffer_f32 );
	amount = buffer_read(buf, buffer_f32 );
}