wait = 80;
index = 0;
if (image_angle == 0) {
    addx = 0;
    addy = 0.5;
}
if (image_angle == 90) {
    addx = 0.5;
    addy = 0;
}
if (image_angle == 180) {
    addx = 0;
    addy = -0.5;
}
if (image_angle == 270) {
    addx = -0.5;
    addy = 0;
}
touch = 0;
image_speed = 0;
dir = 0;
valid = 1;
addx = 0;
addy = 0;
movex = 0;
movey = 0;
nextroom = -1;

DoSave = function() {
	scrSaveGeneric(global.tempSave[room]);
	buffer_write( global.tempSave[room], buffer_f32, wait );
	buffer_write( global.tempSave[room], buffer_f16, index );
	buffer_write( global.tempSave[room], buffer_f32, addx );
	buffer_write( global.tempSave[room], buffer_f32, addy );
	buffer_write( global.tempSave[room], buffer_f32, movex );
	buffer_write( global.tempSave[room], buffer_f32, movey );
	buffer_write( global.tempSave[room], buffer_u8, touch );
	buffer_write( global.tempSave[room], buffer_f32, dir );
	buffer_write( global.tempSave[room], buffer_u8, valid );
	buffer_write( global.tempSave[room], buffer_f16, nextroom );
}
DoLoad = function() {
	scrLoadGeneric(global.tempSave[room]);
	wait = buffer_read(global.tempSave[room], buffer_f32 );
	index = buffer_read(global.tempSave[room], buffer_f16 );
	addx = buffer_read(global.tempSave[room], buffer_f32 );
	addy = buffer_read(global.tempSave[room], buffer_f32 );
	movex = buffer_read(global.tempSave[room], buffer_f32 );
	movey = buffer_read(global.tempSave[room], buffer_f32 );
	touch = buffer_read(global.tempSave[room], buffer_u8 );
	dir = buffer_read(global.tempSave[room], buffer_f32 );
	valid = buffer_read(global.tempSave[room], buffer_u8 );
	nextroom = buffer_read(global.tempSave[room], buffer_f16 );
}