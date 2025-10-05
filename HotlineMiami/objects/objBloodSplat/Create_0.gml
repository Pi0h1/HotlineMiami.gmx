image_speed = 0;
image_angle = random(360);
advancespeed = 0.2 + random(0.05);
done = 0;
image_alpha = 1;
image_blend = merge_color(c_red, c_maroon, random(0.1));

DoSave = function() {
	scrSaveGeneric(global.tempSave[room]);
	buffer_write( global.tempSave[room], buffer_f32, advancespeed );
	buffer_write( global.tempSave[room], buffer_f32, done );
}
DoLoad = function() {
	scrLoadGeneric(global.tempSave[room]);
	advancespeed = buffer_read(global.tempSave[room], buffer_f32 );
	done = buffer_read(global.tempSave[room], buffer_f32 );
}