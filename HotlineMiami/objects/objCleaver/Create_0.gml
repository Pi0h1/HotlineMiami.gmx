bounced = 0;

DoSave = function(buf) {
	scrSaveGeneric(buf);
	buffer_write( buf, buffer_u8, bounced );


}
DoLoad = function(buf) {
	scrLoadGeneric(buf);
	bounced = buffer_read(buf, buffer_u8 );
}