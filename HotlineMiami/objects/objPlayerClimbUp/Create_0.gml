image_speed = 0;
wait = 5;
scrInitMaskPos();
scrUpdateMaskPos(sprite_index);
global.maskon = 1;

DoSave = function(buf) {
	scrSaveGeneric(buf);
	buffer_write( buf, buffer_f32, wait );

}
DoLoad = function(buf) {
	scrLoadGeneric(buf);
	wait = buffer_read(buf, buffer_f32 );
}