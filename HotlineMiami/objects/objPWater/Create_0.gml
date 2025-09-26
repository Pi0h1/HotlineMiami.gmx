image_blend = c_aqua;
image_speed = 0;
image_index = floor(random(5)) * 2;
dist = 70 + random(27);

DoSave = function() {
	scrSaveGeneric(global.tempSave[room]);
	buffer_write( global.tempSave[room], buffer_f32, dist );
}
DoLoad = function() {
	scrLoadGeneric(global.tempSave[room]);
	dist = buffer_read(global.tempSave[room], buffer_f32 );
}