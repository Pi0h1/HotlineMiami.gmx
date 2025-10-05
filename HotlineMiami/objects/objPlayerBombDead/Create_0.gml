friction = 0.1;
bled = 0;

DoSave = function() {
	buffer_write( global.tempSave[room], buffer_f16, bled );
	buffer_write( global.tempSave[room], buffer_f32, friction );


}
DoLoad = function() {
	bled = buffer_read(global.tempSave[room], buffer_f16 );
	friction = buffer_read(global.tempSave[room], buffer_f32 );
}