life = random(30);

DoSave = function(buf) {
	scrSaveGeneric(buf);
	buffer_write( buf, buffer_f32, life );
}
DoLoad = function(buf) {
	scrLoadGeneric(buf);
	life = buffer_read(buf, buffer_f32 );
}