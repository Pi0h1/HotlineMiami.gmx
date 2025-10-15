vspeed = 0;
image_speed = 0;
state = 0;
image_angle = 270;
direction = 270;
siren = 0;

DoSave = function(buf) {
	scrSaveGeneric(buf);
	buffer_write( buf, buffer_u8, state );
	buffer_write( buf, buffer_u8, siren );
}
DoLoad = function(buf) {
	scrLoadGeneric(buf);
	state = buffer_read(buf, buffer_u8 );
	siren = buffer_read(buf, buffer_u8 );
}