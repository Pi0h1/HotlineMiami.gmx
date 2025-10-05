dist = 6 + random(22);
image_speed = 0;
diradd = choose(-1, 1);
image_index = random(100);
wait = 60 + random(40);

DoSave = function() {
	scrSaveGeneric(global.tempSave[room]);
	buffer_write( global.tempSave[room], buffer_f32, dist );
	buffer_write( global.tempSave[room], buffer_f32, wait );
}
DoLoad = function() {
	scrLoadGeneric(global.tempSave[room]);
	dist = buffer_read(global.tempSave[room], buffer_f32 );
	wait = buffer_read(global.tempSave[room], buffer_f32 );
}