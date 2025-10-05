image_speed = 0;
wait = 5;
image_angle = 90;
i = 0;
repeat(32) {
    maskaddx[i] = 0;
    maskaddy[i] = 0;
    i++;
}

DoSave = function() {
	scrSaveGeneric(global.tempSave[room]);
	buffer_write( global.tempSave[room], buffer_f32, wait );

}
DoLoad = function() {
	scrLoadGeneric(global.tempSave[room]);
	wait = buffer_read(global.tempSave[room], buffer_f32 );
}