friction = 0.15;
rotspeed = (-1 + round(random(1)) * 2) * random(8);
image_speed = 0;
image_angle = random(360);
image_index = floor(random(10000));

DoSave = function() {
	scrSaveGeneric(global.tempSave[room]);
	buffer_write( global.tempSave[room], buffer_f32, rotspeed );
}
DoLoad = function() {
	scrLoadGeneric(global.tempSave[room]);
	rotspeed = buffer_read(buff, buffer_f32 );
}