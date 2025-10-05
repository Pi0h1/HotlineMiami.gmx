addspeed = 0.2 + random(0.1);
image_blend = c_red;
image_speed = 0;
image_angle = random(360);
image_xscale = 0.75 + random(0.5);
image_yscale = image_xscale;

DoSave = function() {
	scrSaveGeneric(global.tempSave[room]);
	buffer_write( global.tempSave[room], buffer_f32, addspeed );
}
DoLoad = function() {
	scrLoadGeneric(global.tempSave[room]);
	addspeed = buffer_read(global.tempSave[room], buffer_f32 );
}