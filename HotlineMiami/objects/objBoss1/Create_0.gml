image_speed = 0;
image_index = random(1000);
energie = 2;
scrInitPathFinding();
path = path_add();
path_set_kind(path, 1);
path_set_precision(path, 2);
state = 0;
wait = 30;
hit = 0;

DoSave = function(buf) {
	scrSaveGeneric(buf);
	buffer_write( buf, buffer_f32, energie );
	buffer_write( buf, buffer_u16, state );
	buffer_write( buf, buffer_f32, wait );
	buffer_write( buf, buffer_u8, hit );


}
DoLoad = function(buf) {
	scrLoadGeneric(buf);
	energie = buffer_read(buf, buffer_f32 );
	state = buffer_read(buf, buffer_u16 );
	wait = buffer_read(buf, buffer_f32 );
	hit = buffer_read(buf, buffer_u8 );
}