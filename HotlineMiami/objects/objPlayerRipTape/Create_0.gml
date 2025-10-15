image_speed = 0.2;
image_index = 1;
ripped = false;

DoSave = function(buf) {
	scrSaveGeneric(buf);
	buffer_write( buf, buffer_u8, ripped );

}
DoLoad = function(buf) {
	scrLoadGeneric(buf);
	ripped = buffer_read(buf, buffer_u8 );
}