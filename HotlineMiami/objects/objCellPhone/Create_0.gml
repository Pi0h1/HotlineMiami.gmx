dir_add = -1 + round(random(1)) * 2;
friction = 0.2;

DoSave = function(buf) {
	scrSaveGeneric(buf);
	buffer_write( buf, buffer_f32, dir_add );
}

DoLoad = function(buf) {
	scrLoadGeneric(buf);
	dir_Add = buffer_read(buf, buffer_f32 );
}