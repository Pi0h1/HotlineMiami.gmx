image_speed = 0;
image_angle = 180;
last_sprite = sprite_index;

DoSave = function() {
	scrSaveGeneric(global.tempSave[room]);
	buffer_write( global.tempSave[room], buffer_u32, last_sprite );

}
DoLoad = function() {
	scrLoadGeneric(global.tempSave[room]);
	last_sprite = buffer_read(global.tempSave[room], buffer_u32 );
}