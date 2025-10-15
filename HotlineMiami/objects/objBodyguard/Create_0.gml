image_speed = 0;
wait = 40;
state = 0;
legindex = 0;
path = path_add();
pwait = 0;

DoSave = function(buf) {
	scrSaveGeneric(buf);
	buffer_write( buf, buffer_u16, state );
	buffer_write( buf, buffer_f32, wait );
	buffer_write( buf, buffer_f32, pwait );
	buffer_write( buf, buffer_f16, legindex );

}
DoLoad = function(buf) {
	scrLoadGeneric(buf);
	state = buffer_read(buf, buffer_u16 );
	wait = buffer_read(buf, buffer_f32 );
	pwait = buffer_read(buf, buffer_f32 );
	legindex = buffer_read(buf, buffer_f16 );
}