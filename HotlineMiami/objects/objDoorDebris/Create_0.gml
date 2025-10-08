image_index = random(8);
image_speed = 0;
dir_add = -1 + round(random(2));
image_angle = random(360);
friction = 0.1;

DoSave = function() {
	scrSaveGeneric(global.tempSave[room]);
	buffer_write( global.tempSave[room], buffer_f16, dir_add );
}
DoLoad = function() {
	scrLoadGeneric(global.tempSave[room]);
	dir_add = buffer_read(global.tempSave[room], buffer_f16 );
}