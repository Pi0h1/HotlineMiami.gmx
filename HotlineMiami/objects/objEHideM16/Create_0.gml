image_speed = 0;
shake = 0;
image_index = 5;
energie = 0;
ammo = 20;
dir = 0;

DoSave = function(buf) {
	scrSaveGeneric(buf);
	buffer_write( buf, buffer_f32, energie );
	buffer_write( buf, buffer_f32, ammo );
	buffer_write( buf, buffer_f32, shake );
	buffer_write( buf, buffer_f32, dir );
}
DoLoad = function(buf) {
	scrLoadGeneric(buf);
	energie = buffer_read(buf, buffer_f32 );
	ammo = buffer_read(buf, buffer_f32 );
	shake = buffer_read(buf, buffer_f32 );
	dir = buffer_read(buf, buffer_f32 );
}