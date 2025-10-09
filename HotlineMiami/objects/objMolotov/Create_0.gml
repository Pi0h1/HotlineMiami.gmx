image_angle = random(360);
image_speed = 0.25;
friction = 0.1;
dist = 0;

DoSave = function() {
	scrSaveGeneric(global.tempSave[room]);
	buffer_write(global.tempSave[room], buffer_f32, dist);
}
DoLoad = function () {
	scrLoadGeneric(global.tempSave[room]);
	dist = buffer_read(global.tempSave[room], buffer_f32);
}