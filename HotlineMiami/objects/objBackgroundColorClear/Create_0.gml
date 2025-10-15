dir = random(1000);
color1 = c_black;
color2 = c_black;
if (global.alienware)
    scrAlienWareYellow();

DoSave = function(buf) {
	buffer_write( buf, buffer_f32, dir );
	buffer_write( buf, buffer_f32, color1 );
	buffer_write( buf, buffer_f32, color2 );


}
DoLoad = function(buf) {
	dir = buffer_read(buf, buffer_f32 );
	color1 = buffer_read(buf, buffer_f32 );
	color2 = buffer_read(buf, buffer_f32 );
}