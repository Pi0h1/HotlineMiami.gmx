dir = random(360);
ammoy = -32;

DoSave = function(buf) {
	buffer_write(buf, buffer_f32, dir);
	buffer_write(buf, buffer_f32, ammoy);
}
DoLoad = function(buf) {
	dir = buffer_read(buf, buffer_f32);
	ammoy = buffer_read(buf, buffer_f32);
}