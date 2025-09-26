image_angle = random(360);
image_speed = 0;
image_index = floor(random(9));
dir = 45;
angle_speed = -1 + round(random(1)) * 2;
on = 0;

DoSave = function() {
	scrSaveGeneric(global.tempSave[room]);
	buffer_write( global.tempSave[room], buffer_u8, on );
}
DoLoad = function() {
	scrLoadGeneric(global.tempSave[room]);
	on = buffer_read(global.tempSave[room], buffer_u8);
}