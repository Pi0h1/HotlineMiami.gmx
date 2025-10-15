image_speed = 0;
wait = 5;
image_angle = 90;
i = 0;
repeat(32) {
    maskaddx[i] = 0;
    maskaddy[i] = 0;
    i++;
}

DoSave = function(buf) {
	scrSaveGeneric(buf);
	buffer_write( buf, buffer_f32, wait );

}
DoLoad = function(buf) {
	scrLoadGeneric(buf);
	wait = buffer_read(buf, buffer_f32 );
}