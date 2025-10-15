image_speed = 0;
ammo = 0;
alert = 0;
path = -124;
energie = 0;

DoSave = function(buf) {
	scrSaveGeneric(buf);
	buffer_write( buf, buffer_f32, energie );
	buffer_write( buf, buffer_f32, ammo );
	buffer_write( buf, buffer_f32, alert );
}
DoLoad = function(buf) {
	scrLoadGeneric(buf);
	energie = buffer_read(buf, buffer_f32 );
	ammo = buffer_read(buf, buffer_f32 );
	alert = buffer_read(buf, buffer_f32 );
}