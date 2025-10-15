if (round(random(10)) == 1)
    image_speed = 0.125;
else image_speed = 0;
alarm[0] = 30 + random(100);
state = 0;

wait = 120;
energie = 1;
hit = 0;

path = path_add();

pwait = 0;

DoSave = function(buf) {
	scrSaveGeneric(buf);
	buffer_write( buf, buffer_u16, state );
	buffer_write( buf, buffer_f32, wait );
	buffer_write( buf, buffer_f32, pwait );
	buffer_write( buf, buffer_f32, energie );
	buffer_write( buf, buffer_u8, hit );
	buffer_write( buf, buffer_f32, alarm[0] );

}
DoLoad = function(buf) {
	scrLoadGeneric(buf);
	state = buffer_read(buf, buffer_u16 );
	wait = buffer_read(buf, buffer_f32 );
	pwait = buffer_read(buf, buffer_f32 );
	energie = buffer_read(buf, buffer_f32 );
	hit = buffer_read(buf, buffer_u8 );
	alarm[0] = buffer_read(buf, buffer_f32 );
}