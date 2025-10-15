image_speed = 0;
image_angle = 180;
last_sprite = sprite_index;

DoSave = function(buf) {
	scrSaveGeneric(buf);
	buffer_write( buf, buffer_u32, last_sprite );

}
DoLoad = function(buf) {
	scrLoadGeneric(buf);
	last_sprite = buffer_read(buf, buffer_u32 );
}