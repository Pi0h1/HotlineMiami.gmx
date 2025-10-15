on = 0;
wait = 40;

DoSave = function(buf) {
	buffer_write(buf, buffer_u16, on);
	buffer_write(buf, buffer_u32, wait);
}
DoLoad = function(buf) {
	on = buffer_read(buf, buffer_u16);
	wait = buffer_read(buf, buffer_u32);
}