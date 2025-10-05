on = 0;
wait = 40;

DoSave = function() {
	buffer_write(global.tempSave[room], buffer_u16, on);
	buffer_write(global.tempSave[room], buffer_u32, wait);
}
DoLoad = function() {
	on = buffer_read(global.tempSave[room], buffer_u16);
	wait = buffer_read(global.tempSave[room], buffer_u32);
}