text = "STAGE CLEAR";
dir = 0;
dir2 = 0;
factor = 0;
start_x = 0;

DoSave = function(buf) {
	scrSaveGeneric(buf);	
	buffer_write(buf, buffer_f32, dir);
	buffer_write(buf, buffer_f32, dir2);
	buffer_write(buf, buffer_string, text);
	buffer_write(buf, buffer_f32, factor);
}
DoLoad = function(buf) {
	scrLoadGeneric(buf);	
	dir = buffer_read(buf, buffer_f32);
	dir2 = buffer_read(buf, buffer_f32);
	text = buffer_read(buf, buffer_string);
	factor = buffer_read(buf, buffer_f32);
}