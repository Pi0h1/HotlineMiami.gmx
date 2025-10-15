image_speed = 0;
direction = 180;
speed = 0.5;
image_speed = 0.1;
on = 1;
turn = 1;
state = 0;
alert = 0;

DoSave = function(buf) {
	scrSaveGeneric(buf);
	buffer_write( buf, buffer_u8, state );
	buffer_write( buf, buffer_f16, turn );
	buffer_write( buf, buffer_u8, on );
	buffer_write( buf, buffer_u8, alert );


}
DoLoad = function(buf) {
	scrLoadGeneric(buf);
	state = buffer_read(buf, buffer_u8 );
	turn = buffer_read(buf, buffer_f16 );
	on = buffer_read(buf, buffer_u8 );
	alert = buffer_read(buf, buffer_u8 );
}