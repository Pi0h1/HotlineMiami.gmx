image_speed = 0;
wait = 5;
scrInitMaskPos();
scrUpdateMaskPos(sprite_index);
global.maskon = 1;

DoSave = function() {
	scrSaveGeneric(global.tempSave[room]);
	buffer_write( global.tempSave[room], buffer_f32, wait );

}
DoLoad = function() {
	scrLoadGeneric(global.tempSave[room]);
	wait = buffer_read(global.tempSave[room], buffer_f32 );
}