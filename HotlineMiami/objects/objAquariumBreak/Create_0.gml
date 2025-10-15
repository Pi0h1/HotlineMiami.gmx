image_speed = 0;
frames = sprite_get_number(sprite_index);

DoSave = function(buf) {
	scrSaveGeneric(buf);
	buffer_write( buf, buffer_f16, frames );
}
DoLoad = function(buf) {
	scrLoadGeneric(buf);
	frames = buffer_read(buf, buffer_f16 );
}