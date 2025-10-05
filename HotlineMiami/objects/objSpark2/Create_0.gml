life = random(30);

DoSave = function() {
	scrSaveGeneric(global.tempSave[room]);
	buffer_write( global.tempSave[room], buffer_f32, life );
}
DoLoad = function() {
	scrLoadGeneric(global.tempSave[room]);
	life = buffer_read(global.tempSave[room], buffer_f32 );
}